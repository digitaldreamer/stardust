# eval "$(direnv hook bash)"

export PATH=.:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:~/bin:$PATH
export PATH=$PATH:~/stardust/bin
export PATH=$PATH:~/node_modules/.bin
export PATH=~/.rbenv/bin:$PATH
export PATH=$PATH:~/projects/highlander/bin:~/Library/Python/3.8/bin
export PATH=/Volumes/Keybase/team/paperlesspost.engineering.bin:$PATH
export PATH=/usr/local/opt/postgresql@11/bin:$PATH

# export PATH=$PATH:~/dev/android-sdk-macosx/platform-tools
# export PATH=$PATH:~/development/android-sdk-macosx/platform-tools
export PATH=$PATH:~/go/bin

export VISUAL=vim
export EDITOR=vim
export CLICOLOR=1

# export GOPATH=$GOPATH:~/projects/highlander/go
export GOMOD_ROOT=$GOPATH/pkg/mod
export GOBIN=~/go/bin
alias cdhighlander="cd ~/projects/highlander"
alias gohighlander="cd ~/projects/highlander/go/src/paperless"
alias csshX-load="csshX load-1 load-2 load-3 load-4 load-5 load-6 load-7 load-8"
alias awsinfra="awsmfa -t infra_services arn:aws:iam::512650262249:role/cross_account_services"

alias ppg="docker exec -it projects-postgres-1 bash"
alias ppgup="cd ~/projects; docker-compose up -d postgres"
alias ppgdown="cd ~/projects; docker-compose stop postgres"
alias cdcore="cd ~/projects/core/paperless-post"
alias pptest='. /Volumes/Keybase/team/paperlesspost.engineering/secrets/test/amazon_s3.env; . ~/code/paperless-post/local.env; docker-compose -f docker-compose.test.yml run  testapp /etc/single_test.sh'
# pptest test/unit/models/email/email_record_test.rb
#
# alias dockerk8s="eval $(minikube docker-env)"

eval "$(rbenv init - zsh)"
# eval "$(rbenv init -)"

# readline
LDFLAGS="-L/usr/local/opt/readline/lib"
CPPFLAGS="-I/usr/local/opt/readline/include"

export CORE_BASE_TAG=2021.01.26-21.55.54-324cabc
# 2020.05.01-16.47.33-de430ae

# export CIRCLE_API_TOKEN=159b120dc49ad18bf7a727c75d1e75749c82bef2
export CIRCLE_API_TOKEN=c56f42384894b4577a1e1a0d33074ab7ff4e672f
export CODECOV_TOKEN=eb57f6e9-e9d5-4f66-b65c-5de8dd15a3f5
export GITHUB_TOKEN=fc0e1e89dbd6ff1f12286a7b83b7723f561559a7
export FASTLY_API_KEY=nebNLhXCBXloQbY9i9ZWTpAPjPQxqrfR

export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/paperless-staging:$HOME/.kube/paperless-production
# export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/paperless
# export KUBECONFIG=$HOME/.kube/config

export QUAY_USER=digitaldreamer
export QUAY_PASSWORD=LStnjoXCBse0JLYTRMLCc7ypc1C9z5E7yuLxBf+6BaLGx8fdf3Xzp/iXL0SPbtiC

export AWS_REGION=us-east-1
export AWS_PROFILE=infra_services
# export AWS_ACCESS_KEY_ID=AKIAIILCMPXQYFMHEI3A
# export AWS_SECRET_ACCESS_KEY=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
export SIMPLE_EMAIL_TOPIC=arn:aws:sns:us-east-1:112618625975:emailstate
export SIMPLE_EMAIL_QUEUE_URL=https://sqs.us-east-1.amazonaws.com/112618625975/stork

export MONGODB_ATLAS_USERNAME=akpoxipg
export MONGODB_ATLAS_API_KEY=0d8516d7-50b7-4416-9f77-63567d657138

# make tab to behave like bash shell
setopt noautomenu
setopt nomenucomplete
setopt NO_AUTOLIST BASH_AUTOLIST NO_MENUCOMPLETE
autoload -Uz compinit && compinit

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;243m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n@%m ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '
# PROMPT="%n@%m:%~"
# export PROMPT="%F{cyan}%m%f:%F{red}%2d%F{green}$%f "
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "(%s)")$ '
export PATH="/usr/local/opt/go@1.16/bin:$PATH"

eval "$(direnv hook zsh)"
