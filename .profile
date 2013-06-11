export PATH=/usr/local/share/python:/usr/local/share/python3:/usr/local/share/npm/bin:/Users/$USER/bin:$PATH
export NODE_PATH="/usr/local/lib/node_modules"


# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# django completion
if [ -f ~/.django/django_bash_completion ]; then
   . ~/.django/django_bash_completion
fi


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
alias atom='. atom'


# Shortcut for activating a virtualenv (assumed to be in `pwd`/envs)
alias activate='. envs/bin/activate'


# useful cd shortcuts
alias envs='cd /Users/$USER/envs'
alias projects='cd /Users/$USER/projects'
alias lib='cd /Users/$USER/Google\ Drive/Library/'


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
alias data='./manage.py datamigration'
alias shell='./manage.py shell_plus'
alias srun='./source/manage.py runserver 0.0.0.0:8000'
alias superuser='./manage.py createsuperuser'
alias syncdb='./manage.py syncdb'


# Shortcut to symlink the xapian libs to your virtualenv
# (assumed to be in `pwd`/env)
alias lnxapian='ln -s /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/xapian envs/lib/python2.7/site-packages/. '


# crate new database from template
alias newdb='createdb -T template_postgis'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


# Projects shortcuts
alias alextoys='source /Users/$USER/envs/alextoys/bin/activate && cd /Users/$USER/projects/alextoys/source'
alias btoys='source /Users/$USER/envs/btoys/bin/activate && cd /Users/$USER/projects/btoys'
alias closethq='source /Users/$USER/envs/closethq/bin/activate && cd /Users/$USER/projects/closethq/source'
alias crossover='source /Users/$USER/envs/crossover/bin/activate && cd /Users/$USER/projects/crossover/source'
alias darwin='source /Users/$USER/envs/darwin/bin/activate && cd /Users/$USER/projects/darwin'
alias dotfiles='cd /Users/$USER/projects/dotfiles'
alias hatch='source /Users/$USER/envs/hatch/bin/activate && cd /Users/$USER/projects/hatch/source'
alias hatch='source /Users/$USER/envs/millersoath/bin/activate && cd /Users/$USER/projects/millersoath/source'
alias prinkshop='source /Users/$USER/envs/prinkshop/bin/activate && cd /Users/$USER/projects/prinkshop/source'
alias ssv='source /Users/$USER/envs/ssv/bin/activate && cd /Users/$USER/projects/ssv/source'
alias prinkshop='source /Users/$USER/envs/stardust/bin/activate && cd /Users/$USER/projects/stardust/source'
alias tspxyz='source /Users/$USER/envs/tspxyz/bin/activate && cd /Users/$USER/projects/tspxyz/source'
alias twobirds='source /Users/$USER/envs/twobirds/bin/activate && cd /Users/$USER/projects/twobirds/twobirds'
alias worldranking='source /Users/$USER/envs/worldranking/bin/activate && cd /Users/$USER/projects/worldranking/web-app'

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
[[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


