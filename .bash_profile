HOMEBREW=/usr/local/sbin:/usr/local/bin
RVM=$HOME/.rvm/gems/ruby-2.1.4/bin
POSTGRES_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin
# PASSENGER_CONFIG=/usr/local/Cellar/passenger/5.0.24/libexec/lib/phusion_passenger/locations.ini
USER_BIN=$HOME/bin
ARCANIST_PATH=$HOME/bin/arcanist/bin
export PATH=$RVM:$HOMEBREW:$USER_BIN:$ARCANIST_PATH:$POSTGRES_PATH:$PHP_PATH:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH:.
export NODE_PATH="/usr/local/lib/node_modules"
export AWS_DEFAULT_REGION=us-east-1

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# export HOMEBREW_GITHUB_API_TOKEN=<github_token>


#-------------------------------------------------------------
# VirtualEnvWrapper
#-------------------------------------------------------------

export WORKON_HOME=$HOME/venv
export PROJECT_HOME=$HOME/projects
export VIRTUALENV_PYTHON=/usr/local/bin/python  # User Python installed by Homebrew
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python  # User Python installed by Homebrew
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh


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


export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# pyenv completion
eval "$(pyenv init -)"
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# eval "$(pyenv virtualenv-init -)"


# Terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# Always enable GREP colors
export GREP_OPTIONS='--color=auto'


# complete sudo and man-pages
complete -cf sudo man


# Default Editor
export EDITOR='subl -w'


# prompt colors/format
# PS1="[\d \u@\s] ~/\W:"
# PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\] $(__git_ps1 "(%s)") -> \[\033[00m\]'
PS1='\[\033[01;32m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\]$(__git_ps1 " (%s)") -> \[\033[00m\]'


# Bash history remove dublicates
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
