eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export SUBLIME_PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin"

USER_BIN_PATH="$HOME/bin"
HOMEBREW_PATH="$(brew --prefix)/bin"
BZIP2_PATH="$(brew --prefix bzip2)/bin"
POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"
OPEN_SSL_PATH="$(brew --prefix openssl)/bin"

export PYENV_ROOT="$HOME/.pyenv/bin"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH=$SUBLIME_PATH:$OPEN_SSL_PATH:$USER_BIN_PATH:$POSTGRES_PATH:$HOME:$BZIP2_PATH:$HOMEBREW_PATH:$PYENV_ROOT:$PATH:.
export GPG_TTY=$(tty)

# Separate aliases file
source $HOME/.aliases
source $HOME/.functions

# Get a fortune
fortune
