HOMEBREW_PATH=/usr/local/sbin:/usr/local/bin
RVM_PATH=$HOME/.rvm/gems/default/bin
NPM_PATH=/usr/local/bin/npm
POSTGRES_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin
SQLITE_PATH=/usr/local/opt/sqlite/bin
OPEN_SSL_PATH=/usr/local/opt/openssl/bin
USER_BIN_PATH=$HOME/bin
BZIP2_PATH=/usr/local/opt/bzip2/bin

export PATH=$SQLITE_PATH:$OPEN_SSL_PATH:$RVM_PATH:$USER_BIN_PATH:$POSTGRES_PATH:$NPM_PATH:$HOME:$BZIP2_PATH:$HOMEBREW_PATH:$PATH:.
export NODE_PATH=/usr/local/lib/node_modules
export GPG_TTY=$(tty)

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Get a fortune
if [ -f /usr/local/bin/fortune ]; then
    fortune
fi


#-----#
# NVM #
#-----#
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#-----------#
# AWS Vault #
#-----------#
export AWS_VAULT_PASS_PREFIX=aws-vault
export AWS_VAULT_BACKEND=pass

#---------#
# OpenSSL #  # Order matters, the first exports don't have -L/-I
#---------#
export LDFLAGS="$(brew --prefix openssl)/lib"
export CPPFLAGS="$(brew --prefix openssl)/include"
export PKG_CONFIG_PATH="$(brew --prefix openssl)/lib/pkgconfig"

#------#
# zlib #
#------#
export LDFLAGS="${LDFLAGS} -L$(brew --prefix zlib)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix zlib)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix zlib)/lib/pkgconfig"


#-------#
# bzip2 #
#-------#
export LDFLAGS="${LDFLAGS} -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix bzip2)/include"


#----------#
# readline #
#----------#
export LDFLAGS="${LDFLAGS} -L$(brew --prefix readline)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix readline)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix readline)/lib/pkgconfig"

#-------#
# icu4c #
#-------#
export LDFLAGS="${LDFLAGS} -L$(brew --prefix icu4c)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix icu4c)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix icu4c)/lib/pkgconfig"

#--------#
# sqlite #
#--------#
export LDFLAGS="${LDFLAGS} -L$(brew --prefix sqlite)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix sqlite)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix sqlite)/lib/pkgconfig"

#--------#
# LibFFI #
#--------#
export LDFLAGS="-L${LDFLAGS} -L$(brew --prefix libffi)/lib"
export CPPFLAGS="-I${CPPFLAGS} -I$(brew --prefix libffi)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(brew --prefix libffi)/lib/pkgconfig"

#-------------------#
# VirtualEnvWrapper #
#-------------------#
export WORKON_HOME=$HOME/venv
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME

# Auto Suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Auto highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


#------------------#
# DEFAULT SETTINGS #
#------------------#

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Shorten directory shown
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=””
POWERLEVEL9K_SHORTEN_STRATEGY=”truncate_from_right”

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Update automatically
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize pip python brew osx django pyenv pipenv npm)
source $ZSH/oh-my-zsh.sh

# User configuration

# Set default user to avoid showing 'user' on every line
DEFAULT_USER=alex.zagoro

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id.pub"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="subl ~/.zshrc"
# alias ohmyzsh="subl ~/.oh-my-zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Ansible
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export NO_PROXY="*"

# AWS Vault
export AWS_VAULT_BACKEND=keychain
export AWS_VAULT_KEYCHAIN_NAME=aws-vault

# PyEnv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
pyenv virtualenvwrapper_lazy
SYSTEM_VERSION_COMPAT=1
