import os
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
        lines = []
        for repo in sorted(self.repos):
            lines.append(f'sudo add-apt-repository -y {repo}')
        return '\n'.join(lines)


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
            'mkdir -p packages',
            'cd packages',
            '',
        ]
        for git_package in self.packages:
            lines.append(f'if [ ! -d "{git_package["path"]}" ] ; then')
            lines.append(f'{indent}git clone {git_package["clone"]}')

            if 'commands' in git_package:
                lines.append(indent + 'cd ' + git_package['path'])
                for cmd in git_package['commands']:
                    lines.append(indent + cmd)
                lines.append(indent + 'cd ..')

            lines.append('fi')
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


class PreInstalls(ShellCommands):
    key = 'pre-install'


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
                    links.append(f'ln -f "{link_path}" "$HOME/{link_path}"')
                else:
                    links.append(f'ln -f {link_path} $HOME/{link_path}')

        dir_lines = []
        for dir in sorted(dirs):
            if ' ' in dir:
                dir = f'"{dir}"'
            dir_lines.append(f'mkdir -p $HOME/{dir}')

        return ''.join([
            'cd settings\n\n',
            '\n'.join(dir_lines),
            '\n\n',
            '\n'.join(sorted(links)),
            '\n\ncd ..'
        ])


if __name__ == '__main__':
    handlers = [
        PreInstalls(),
        AptRepositories(),
        SystemPackages(),
        GitPackages(),
        PackageConfigs(),
        PostInstalls(),
        Symlinks(),
    ]

    for file in os.listdir('templates'):
        with open('templates/' + file) as install_file:
            print('loading file ', file)
            data = json.load(install_file)
            for key, values in data.items():
                if not isinstance(values, list):
                    values = [values]
                for handler in handlers:
                    if handler.key == key:
                        handler += values

    for handler in handlers:
        with open(f'install/{handler.key}.sh', 'w') as handler_file:
            print('Writing handler ' + handler.__class__.__name__)
            handler_file.write("#! /bin/sh\n\n")
            handler_file.write("set -exu\n\n")
            handler_file.write(handler.combine())
