HOMEBREW=/usr/local/sbin:/usr/local/bin
DOTFILES_BIN=$HOME/dotfiles/bin
RVM=/Users/typhoon/.rvm/gems/ruby-2.1.0/bin
WORKON_HOME=$HOME/venvs

PASSENGER_CONFIG=/usr/local/Cellar/passenger/4.0.33/libexec/lib/phusion_passenger/locations.ini

export PATH=$RVM:$PASSENGER_CONFIG:$HOMEBREW:$DOTFILES_BIN:/usr/local/share/npm/bin:$HOME/bin:$HOME/.rvm/bin:$PATH:.
export NODE_PATH="/usr/local/lib/node_modules"

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


# Always enable GREP colors
export GREP_OPTIONS='--color=auto'


# complete sudo and man-pages
complete -cf sudo man


# Default Editor
# export EDITOR='subl -w'


# prompt colors/format
# PS1="[\d \u@\s] ~/\W:"
PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\] $(__git_ps1 "(%s)") -> \[\033[00m\]'


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

# Functions
# TODO: move to ~/.bash_functions

# list after cd
cd() { builtin cd "$@"; ll; }


# remind (remindme <time> <text>)
function remindme()
{
    sleep $1 && zenity --info --text "$2" &
}

# extract all compressed files
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
