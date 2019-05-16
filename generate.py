# generates the full install.sh script
# built from toml files inside /install
import os
import sys
import json


def subheader(label):
    comment = '#' * len(label)
    return f'echo {comment}\necho {label}\necho {comment}\n\n'


indent = '  '
header = f"""# This file was auto generated
# View the readme on how to edit
# To regenerate run `python generate.py`

{subheader("Installing Essentials")}sudo apt install -y \\
{indent}software-properties-common \\
{indent}build-essential \\
{indent}curl \\
{indent}git
sudo apt upgrade -y
sudo apt update

git clone https://github.com/miniscruff/dotfiles.git

"""

footer = f"""{subheader("Completed")}"""


def combine_apt_repositories(repos):
    repos = set(repos)
    lines = [f'sudo add-apt-repository -y']
    for repo in sorted(repos):
        lines.append(f'{indent}{repo}')
    return subheader('Adding Apt Repositories') + ' \\\n'.join(lines)


def combine_system_packages(packages):
    packages = set(packages)
    lines = ['sudo apt install -y']
    for package in sorted(packages):
        lines.append(f'{indent}{package}')
    return subheader('Installing System Packages') + ' \\\n'.join(lines)


def combine_git_packages(packages):
    lines = [
        'cd dotfiles',
        'mkdir packages',
        'cd packages',
        '',
    ]
    for git_package in packages:
        lines.append('echo Installing ' + git_package['path'])
        lines.append(f'git clone {git_package["clone"]}')
        lines.append('cd ' + git_package['path'])
        lines.extend(git_package['commands'])
        lines.append('cd ..')
        lines.append('')
    lines.append('cd ../..')

    return subheader('Installing Git Packages') + '\n'.join(lines)


def combine_package_configs(commands):
    return subheader('Running package configs') + '\n'.join(commands) + '\n\n'


def combine_post_installs(commands):
    return subheader('Running post install') + '\n'.join(commands) + '\n\n'


combine_order = [
    ('apt-repositories', combine_apt_repositories),
    ('system-packages', combine_system_packages),
    ('git-packages', combine_git_packages),
    ('package-configs', combine_package_configs),
]

def settings_file_symlink():
    lines = []
    for root, _, files in os.walk('settings'):
        for filename in files:
            link_path = f'{root}/{filename}'.replace('settings/', '')
            lines.append(f'ln dotfiles/{root}/{filename} {link_path}')
    return ''.join([
        subheader('Creating symlinks'),
        '\n'.join(lines),
        '\n\n'
    ])


def merge_commands(all_commands):
    return '\n\n'.join(
        func(all_commands[key])
        for key, func in combine_order
        if key in all_commands
    )


if __name__ == '__main__':
    all_commands = {
        "apt-repositories": [],
        "system-packages": [],
        "git-packages": [],
        "git-install": [],
        "package-configs": [],
        "post-install": [],
    }
    for file in os.listdir('install'):
        with open('install/' + file) as install_file:
            print('loading file ', file)
            data = json.load(install_file)
            for key, value in data.items():
                if not isinstance(value, list):
                    value = [value]
                all_commands[key] += value

    final_script = merge_commands(all_commands)
    symlinks = settings_file_symlink()
    print('combining scripts')
    with open('install.sh', 'w') as script_file:
        script_file.write(header)
        script_file.write(final_script)
        script_file.write(symlinks)
        script_file.write(combine_post_installs(all_commands['post-install']))
        script_file.write(footer)
