# MacPorts Installer addition on 2011-07-19_at_07:17:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=/opt/local/lib/postgresql91/bin:$PATH
export NODE_PATH="/opt/local/lib/node_modules/"


# Bash completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


# Django Completion
. ~/.django/django_bash_completion

# npm completion
source /opt/local/lib/node_modules/npm/lib/utils/completion.sh

# pip completion
_pip_completion()
{
   COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                  COMP_CWORD=$COMP_CWORD \
                  PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip


# Terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# Default Editor
# export EDITOR=/usr/bin/mate

# Bash format
# PS1="[\d \u@\s] ~/\W:"
PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\]-> \[\033[00m\]'


# Bash history remove dublicates
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend


# Bash shortcuts
alias ..='cd ..'
alias ll='ls -ahlF'
alias getip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'


# Shortcut for activating a virtualenv (assumed to be in `pwd`/envs)
alias activate='. envs/bin/activate'


# cd to envs folder
alias envs='cd /Users/typhoon/envs'


# Removes all *.pyc from current directory and all subdirectories
alias pycclean='find . -name "*.pyc" -exec rm {} \;'


# Shortcut to determine your current PYTHONPATH, useful in debugging when switching between virtualenv’s
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'

# django management commands aliases
alias collectstatic='./manage.py collectstatic --noinput'
alias compress='./manage.py compress'
alias dbshell='./manage.py dbshell'
alias loaddata='./manage.py loaddata'
alias migrate='./manage.py migrate'
alias rebuild='./manage.py rebuild_index'
alias run='./manage.py runserver 0.0.0.0:8000'
alias schema='./manage.py schemamigration'
alias shell='./manage.py shell_plus'
alias srun='./source/manage.py runserver 0.0.0.0:8000'
alias superuser='./manage.py createsuperuser'
alias syncdb='./manage.py syncdb'


# Shortcut to symlink the xapian libs to your virtualenv
# (assumed to be in `pwd`/env)
alias lnxapian='ln -s /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/xapian envs/lib/python2.7/site-packages/. '


# Shortcut for PostgreSQL server start/stop
alias pgstart='sudo su postgres -c '\''/opt/local/lib/postgresql91/bin/pg_ctl -D /opt/local/var/db/postgresql91/defaultdb start'\'''
# alias pgstart='sudo su postgres -c '\''/opt/local/lib/postgresql91/bin/postgres -D /opt/local/var/db/postgresql91/defaultdb'\'''
alias pgstop='sudo su postgres -c '\''/opt/local/lib/postgresql91/bin/pg_ctl -D /opt/local/var/db/postgresql91/defaultdb stop'\'''
# crate new database from template
alias newdb='createdb -T template_postgis'

# Projects shortcuts
alias alextoys='source /Users/typhoon/envs/alextoys/bin/activate && cd /Users/typhoon/projects/alextoys/source'
alias btoys='source /Users/typhoon/envs/btoys/bin/activate && cd /Users/typhoon/projects/btoys'
alias closethq='source /Users/typhoon/envs/closethq/bin/activate && cd /Users/typhoon/projects/closethq/source'
alias crossover='source /Users/typhoon/envs/crossover/bin/activate && cd /Users/typhoon/projects/crossover/source'
alias darwin='source /Users/typhoon/envs/darwin/bin/activate && cd /Users/typhoon/projects/darwin'
alias dotfiles='cd /Users/typhoon/projects/dotfiles'
alias hatch='source /Users/typhoon/envs/hatch/bin/activate && cd /Users/typhoon/projects/hatch/source'
alias prinkshop='source /Users/typhoon/envs/prinkshop/bin/activate && cd /Users/typhoon/projects/prinkshop/source'
alias ssv='source /Users/typhoon/envs/ssv/bin/activate && cd /Users/typhoon/projects/ssv/source'
alias tspxyz='source /Users/typhoon/envs/tspxyz/bin/activate && cd /Users/typhoon/projects/tspxyz/source'
alias twobirds='source /Users/typhoon/envs/twobirds/bin/activate && cd /Users/typhoon/projects/twobirds/twobirds'
alias worldranking='source /Users/typhoon/envs/worldranking/bin/activate && cd /Users/typhoon/projects/worldranking/web-app'

# Nav shortcuts
alias lib='cd /Users/typhoon/Google\ Drive/Library/'

# Server restart
alias reloadnginx='sudo /etc/init.d/nginx reload'
alias reloadmemcached='sudo /etc/init.d/memcached restart'
alias reloadapache='sudo /etc/init.d/apache2 reload'
alias reloadpostgres='sudo /etc/init.d/postgresql restart'
alias reloadservers='reloadnginx; reloadmemcached; reloadapache'

# Running realtime sass proccess for monitoring static files
alias runsass='sass --scss --watch core/static/scss:static/css'


# Load RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "/Users/typhoon/.rvm/scripts/rvm" ]] && source "/Users/typhoon/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


