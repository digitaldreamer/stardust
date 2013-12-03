from fabric.api import *
from fabric.contrib.console import confirm

env.hosts = []
env.user = 'root'
env.user_home = '/root'


def test():
    run('touch hello_world.py')

def init():
    _apt_get('make')
    _apt_get('git')
    github('stardust')

def adduser():
    user = raw_input('Username: ')
    cmd = '~/stardust/bin/staradduser -s %s' % user
    dir = '/home/%s/stardust' % user

    # get stardust
    run(cmd)
    github('stardust', dir=dir)

    # give user ownership
    cmd = 'chown -R %s:%s %s' % (user, user, dir)
    run(cmd)

def github(project, dir=''):
    cmd = 'git clone https://github.com/tspxyz/%s.git' % project

    if dir:
        cmd = '%s %s' % (cmd, dir)
    run(cmd)


# utilities
def _apt_get(package):
    """
    Install a single package on the remote server with Apt.
    """
    sudo('apt-get install -y %s' % package)


def _easy_install(package):
    """
    Install a single package on the remote server with easy_install.
    """
    sudo('easy_install %s' % package)


def _virtualenv(command):
    """
    Executes a command in this project's virtual environment.
    """
    if not ENVS_PATH or not PROJECT:
        print('ERROR: project vars not set. exiting virtialenv')
        return False

    run('source %s/%s/bin/activate && %s' % (ENVS_PATH, PROJECT, command))
