HOMEBREW=/usr/local/sbin:/usr/local/bin
DOTFILES_BIN=$HOME/dotfiles/bin
RVM=/Users/typhoon/.rvm/gems/ruby-2.1.0/bin

PASSENGER_CONFIG=/usr/local/Cellar/passenger/4.0.33/libexec/lib/phusion_passenger/locations.ini

export PATH=$RVM:$PASSENGER_CONFIG:$HOMEBREW:$DOTFILES_BIN:/usr/local/share/npm/bin:$HOME/bin:$HOME/.rvm/bin:$PATH
export NODE_PATH="/usr/local/lib/node_modules"

# need for makara
export BPMAG_CONFIG_PATH=/Users/typhoon/projects/makara/config/local.cfg


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
elif [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
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
PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\] $(__git_ps1 "(%s)") -> \[\033[00m\]'


# Bash history remove dublicates
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Alias definitions.

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash shortcuts
alias ..='cd ..'
alias ll='ls -ahlF'
alias getip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias atom='. atom'

# Shortcut for activating a virtualenv (assumed to be in `pwd`/envs)
alias activate='. envs/bin/activate'

# useful cd shortcuts
alias envs='cd $HOME/envs'
alias projects='cd $HOME/projects'
alias lib='cd $HOME/Google\ Drive/Library'
alias sublpackages='cd $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User'

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

# pyramid commands aliases
alias prun='pserve development.ini --reload'
alias pshell='pshell development.ini'

# Shortcut to symlink the xapian libs to your virtualenv
# (assumed to be in `pwd`/env)
alias lnxapian='ln -s /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/xapian envs/lib/python2.7/site-packages/. '

# crate new database from template
alias newdb='createdb -T template_postgis'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Server restart
alias reloadnginx='sudo /etc/init.d/nginx reload'
alias reloadmemcached='sudo /etc/init.d/memcached restart'
alias reloadapache='sudo /etc/init.d/apache2 reload'
alias reloadpostgres='sudo /etc/init.d/postgresql restart'
alias reloadservers='reloadnginx; reloadmemcached; reloadapache'

# Running realtime sass proccess for monitoring static files
alias runsass='sass --scss --watch core/static/scss:static/css'


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
