from fabric.api import *
from fabric.contrib.console import confirm

env.hosts = ['localhost']

def test():
    run('touch hello_world.py')

def server():
    """
    (1) Sets up a server after you initialized it. Read the instructions at the top of this document to see how to prep the server.

    THIS RESETS THE DATABASE, DO NOT RUN THIS IF YOU HAVE AN ACTIVE DATABASE
    """
    print("Executing on %(host)s as %(user)s" % env)

    # locale
    sudo('locale-gen en_US.UTF-8')
    sudo('update-locale LANG=en_US.UTF-8')

    # server
    _apt_get('build-essential')
    _apt_get('emacs23')
    _apt_get('git-core')
    _apt_get('bash-completion')
    _apt_get('nginx')
    # _apt_get('apache2')
    # _apt_get('libapache2-mod-wsgi')
    _apt_get('python-dev')
    _apt_get('python-setuptools')
    _apt_get('python-imaging')
    _apt_get('python-mysqldb')
    _apt_get('postgresql')
    _apt_get('python-psycopg2')
    _apt_get('sqlite3')
    # _apt_get('mongodb')
    _apt_get('mercurial')
    _apt_get('subversion')
    # _apt_get('memcached')
    # _apt_get('apt-xapian-index')
    # _apt_get('xapian-omega')
    # _apt_get('python-xapian')
    # _apt_get('openjdk-6-jdk')
    # _apt_get('libpq-dev')
    # _apt_get('postfix')

    # global python environment
    _easy_install('virtualenv')

    # github()
    # postgres()


def postgres():
    """
    fix postgres encoding
    """
    sudo('pg_dropcluster --stop 8.4 main')
    sudo('pg_createcluster --start -e UTF-8 8.4 main')


def cron():
    """
    set up backup directory for cron
    """
    pass


def github():
    """
    Sets up global variables for github.
    """
    pass


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
