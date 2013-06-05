DOTFILES=~/dotfiles

all: hello

hello:
	ln -s $(DOTFILES)/.vimrc ~/.testlink

bash:
	mv ~/.bashrc ~/.bashrc.bk
	ln -s $(DOTFILES)/.bashrc ~/.bashrc

emacs:
	ln -s $(DOTFILES)/.emacs ~/.emacs

vim:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
