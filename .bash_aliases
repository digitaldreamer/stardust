# bash shortcuts
alias atom='. atom'
alias getip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias skim="(head -5; tail -5) <"
alias su="su -"
alias sudo="sudo -E"
alias whichall="type -all"
alias flushdns="dscacheutil -flushcache"
alias unsetdjangoenv="unset DJANGO_SETTINGS_MODULE"


# list shortcuts
alias ll="ls -ahlF"
alias sortbysize="ls -s | sort -n"


# verbose output
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"


# colors colors colors
alias grep="grep --color=auto"
alias less="less -r"
alias tree="tree -C"


# useful cd shortcuts
alias ..="cd .."
alias ...="cd ../../"
alias envs="cd $HOME/envs"
alias lib="cd $HOME/Google\ Drive/Library"
alias projects="cd $HOME/projects"
alias sublpackages="cd $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"


# shortcut for activating a virtualenv (assumed to be in `pwd`/envs)
alias activate=". envs/bin/activate"


# removes all *.pyc from current directory and all subdirectories
alias pycclean='find . -name "*.pyc" -exec rm {} \;'


# shortcut to determine your current PYTHONPATH, useful in debugging when switching between virtualenv’s
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'


# django management commands aliases
alias collectstatic='./manage.py collectstatic --noinput'
alias compress='./manage.py compress'
alias shell='./manage.py shell_plus'
alias dbshell='./manage.py dbshell'
alias debshell='./manage.py debugsqlshell'
alias loaddata='./manage.py loaddata'
alias data='./manage.py datamigration'
alias schema='./manage.py schemamigration'
alias migrate='./manage.py migrate'
alias rebuildindex='./manage.py rebuild_index --noinput --verbosity=2'
alias run='./manage.py runserver 0.0.0.0:8000'
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


# FU stuff
alias setfu="export DJANGO_SETTINGS_MODULE='fu_web.settings.development'"
