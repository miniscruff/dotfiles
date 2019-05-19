import os
import sys
import json


indent = '  '


class AptRepositories:
    key = 'apt-repositories'

    def __init__(self):
        self.repos = set()

    def __iadd__(self, other):
        self.repos.update(other)
        return self

    def combine(self):
        lines = [f'sudo add-apt-repository -y']
        for repo in sorted(self.repos):
            lines.append(f'{indent}{repo}')
        return ' \\\n'.join(lines)


class SystemPackages:
    key = 'system-packages'

    def __init__(self):
        self.packages = set()

    def __iadd__(self, other):
        self.packages.update(other)
        return self

    def combine(self):
        lines = ['sudo apt install -y']
        for package in sorted(self.packages):
            lines.append(f'{indent}{package}')
        return ' \\\n'.join(lines)


class GitPackages:
    key = 'git-packages'

    def __init__(self):
        self.packages = []

    def __iadd__(self, other):
        self.packages.extend(other)
        return self

    def combine(self):
        lines = [
            'mkdir packages',
            'cd packages',
            '',
        ]
        for git_package in self.packages:
            lines.append(f'git clone {git_package["clone"]}')
            if 'path' in git_package:
                lines.append('cd ' + git_package['path'])
                lines.extend(git_package['commands'])
                lines.append('cd ..')
            lines.append('')
        lines.append('cd ..')

        return '\n'.join(lines)


class ShellCommands:

    def __init__(self):
        self.commands = []

    def __iadd__(self, other):
        self.commands.extend(other)
        return self

    def combine(self):
        return '\n'.join(self.commands)


class PackageConfigs(ShellCommands):
    key = 'package-configs'


class PostInstalls(ShellCommands):
    key = 'post-install'


class Symlinks:
    key = 'symlinks'

    def combine(self):
        dirs = set()
        links = []
        for root, _, files in os.walk('settings'):
            for filename in files:
                link_path = f'{root}/{filename}'[9:] # remove settings/
                if '/' in link_path:
                    parent_folder = link_path[:link_path.rfind('/')]
                    dirs.add(parent_folder)

                if ' ' in link_path:
                    links.append(f'ln "{link_path}" "$HOME/{link_path}"')
                else:
                    links.append(f'ln {link_path} $HOME/{link_path}')

        dir_lines = []
        for dir in sorted(dirs):
            if ' ' in dir:
                dir = f'"{dir}"'
            dir_lines.append(f'mkdir $HOME/{dir}')

        return ''.join([
            'cd settings\n\n',
            '\n'.join(dir_lines),
            '\n\n',
            '\n'.join(links),
            '\n\ncd ..'
        ])


if __name__ == '__main__':
    handlers = [
        AptRepositories(),
        SystemPackages(),
        GitPackages(),
        PackageConfigs(),
        PostInstalls(),
        Symlinks(),
    ]

    for file in os.listdir('install'):
        with open('install/' + file) as install_file:
            print('loading file ', file)
            data = json.load(install_file)
            for key, values in data.items():
                if not isinstance(values, list):
                    values = [values]
                for handler in handlers:
                    if handler.key == key:
                        handler += values

    for handler in handlers:
        with open(f'scripts/{handler.key}.sh', 'w') as handler_file:
            print('Writing handler ' + handler.__class__.__name__)
            handler_file.write(handler.combine())
