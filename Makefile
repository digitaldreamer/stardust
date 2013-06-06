ALL=bash vim
DOTFILES=~/dotfiles

.PHONY: $(ALL)

help:
	cat $(DOTFILES)/README.rst

all: $(ALL)

bash:
	mv ~/.bashrc ~/.bashrc.bk
	ln -s $(DOTFILES)/.bashrc ~/.bashrc

emacs:
	ln -s $(DOTFILES)/.emacs ~/.emacs

vim:
	ln -s $(DOTFILES)/.vimrc ~/.vimrc
	mkdir ~/.vim
	cp -R $(DOTFILES)/vim/* ~/.vim/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
	cd ~/.vim/bundle/command-t/; rake make

ubuntu:
	sudo apt-get install -y virtualbox-guest-additions
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
	sudo apt-get install -y postgresql
	sudo apt-get install -y python-psycopg2
	sudo apt-get install -y sqlite3
	sudo apt-get install -y mongodb
	sudo apt-get install -y mercurial
	sudo apt-get install -y subversion
	sudo apt-get install -y memcached
	#sudo apt-get install -y apt-xapian-index
	#sudo apt-get install -y xapian-omega
	#sudo apt-get install -y python-xapian
	#sudo apt-get install -y openjdk-6-jdk
	sudo apt-get install -y nodejs
	sudo apt-get install -y npm
	#sudo apt-get install -y libpq-dev
	#sudo apt-get install -y postfix
	sudo easy_install virtualenv
