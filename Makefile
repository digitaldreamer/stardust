ALL=bash vim
STARDUST=~/stardust
UNAME := $(shell uname) # detech os, not windows compliant

.PHONY: help vbox $(ALL)

#ifeq ($(wildcard file1),)
#    CLEAN_SRC =
#else
#    CLEAN_SRC = *.h file3
#endif

help:
	cat $(STARDUST)/README.rst

all: $(ALL)

vbox: ubuntu vim bash
	rm ~/supernova

bash:
	if [ "$(shell uname)" = "Linux" ]; then\
		rsync --ignore-existing ~/.bashrc ~/.bashrc.bk;\
		rm ~/.bashrc;\
		ln -s $(STARDUST)/.bashrc ~/.bashrc;\
	elif [ "$(shell uname)" = "Darwin" ]; then\
		ln -s $(STARDUST)/.bashrc ~/.bash_profile;\
	fi

emacs:
	ln -s $(STARDUST)/.emacs ~/.emacs

vim:
	ln -s $(STARDUST)/.vimrc ~/.vimrc
	mkdir -p ~/.vim
	cp -R $(STARDUST)/vim/* ~/.vim/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
	cd ~/.vim/bundle/command-t/; rake make

ubuntu:
	mkdir -p ~/bin ~/envs ~/projects ~/www
	sudo apt-get install -y python-software-properties
	sudo add-apt-repository ppa:chris-lea/node.js
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install -y vim
	#sudo apt-get install -y emacs
	#sudo apt-get install -y ssh
	sudo apt-get install -y ruby1.9.3
	sudo apt-get install -y rake
	sudo apt-get install -y htop
	sudo apt-get install -y build-essential
	sudo apt-get install -y git-core
	sudo apt-get install -y bash-completion
	sudo apt-get install -y nginx
	#sudo apt-get install -y mysql-server
	#sudo apt-get install -y apache2
	#sudo apt-get install -y libapache2-mod-php5
	#sudo apt-get install -y libapache2-mod-wsgi
	#sudo apt-get install -y php5-mysql
	sudo apt-get install -y python-dev
	sudo apt-get install -y python-setuptools
	sudo apt-get install -y python-imaging
	#sudo apt-get install -y python-mysqldb
	sudo apt-get install -y libpq-dev
	sudo apt-get install -y postgresql
	sudo apt-get install -y python-psycopg2
	sudo apt-get install -y sqlite3
	sudo apt-get install -y mongodb
	#sudo apt-get install -y git-core
	sudo apt-get install -y mercurial
	sudo apt-get install -y subversion
	sudo apt-get install -y memcached
	#sudo apt-get install -y apt-xapian-index
	#sudo apt-get install -y xapian-omega
	#sudo apt-get install -y python-xapian
	#sudo apt-get install -y openjdk-6-jdk
	sudo apt-get install -y nodejs
	#sudo apt-get install -y postfix
	sudo easy_install virtualenv
	cd ~/; npm install less
