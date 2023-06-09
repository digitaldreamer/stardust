eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export SUBLIME_PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin"

HOMEBREW_PATH=/opt/homebrew/bin
RVM_PATH=$HOME/.rvm/gems/default/bin
NPM_PATH=/usr/local/bin/npm
POSTGRES_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin
SQLITE_PATH=/usr/local/opt/sqlite/bin
OPEN_SSL_PATH=/usr/local/opt/openssl@3/bin
USER_BIN_PATH=$HOME/bin
BZIP2_PATH=/usr/local/opt/bzip2/bin

export PYENV_ROOT="$HOME/.pyenv/bin"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH=$SUBLIME_PATH:$SQLITE_PATH:$OPEN_SSL_PATH:$RVM_PATH:$USER_BIN_PATH:$POSTGRES_PATH:$NPM_PATH:$HOME:$BZIP2_PATH:$HOMEBREW_PATH:$PYENV_ROOT:$PATH:.
export NODE_PATH=/usr/local/lib/node_modules
export GPG_TTY=$(tty)

# Separate aliases file
source $HOME/.aliases
source $HOME/.functions

# Get a fortune
fortune
