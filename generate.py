# generates the full install.sh script
# built from toml files inside /install
import os
import sys
import json


def subheader(label):
    comment = '#' * (len(label) + 5)
    return f'{comment}\necho {label}\n{comment}\n\n'


indent = '  '
header = f"""# This file was auto generated
# View the readme on how to edit
# To regenerate run `python generate.py`

{subheader("Installing Essentials")}sudo apt install -y software-properties-common build-essential git
sudo apt upgrade -y
sudo apt update

"""


def combine_apt_repositories(repos):
    repos = set(repos)
    lines = [f'sudo add-apt-repository {repos.pop()}']
    for repo in repos:
        lines.append(f'{indent}{repo}')
    return subheader('Adding Apt Repositories') + ' \\ \n'.join(lines)


def combine_system_packages(packages):
    packages = set(packages)
    lines = [f'sudo install -y {packages.pop()}']
    for package in packages:
        lines.append(f'{indent}{package}')
    return subheader('Installing System Packages') + ' \\ \n'.join(lines)


def combine_git_packages(packages):
    lines = []
    for git_package in packages:
        lines.append('echo Installing ' + git_package['path'])
        lines.append(f'git clone {git_package["clone"]}')
        lines.append('cd ' + git_package['path'])
        lines.extend(git_package['commands'])
        lines.append('cd ..')
        lines.append('')

    return subheader('Installing Git Packages') + '\n'.join(lines)


def combine_package_configs(commands):
    return ''


def combine_post_installs(commands):
    return ''


combine_order = [
    ('apt-repositories', combine_apt_repositories),
    ('system-packages', combine_system_packages),
    ('git-packages', combine_git_packages),
    ('package-configs', combine_package_configs),
    ('post-install', combine_post_installs),
]

def settings_file_symlink():
    pass


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
        "package-config": [],
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
    print('combining scripts')
    with open('install.sh', 'w') as script_file:
        script_file.write(header)
        script_file.write(final_script)
