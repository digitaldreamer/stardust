DOTFILES=~/dotfiles

.PHONY: bash emacs vim

all: bash emacs vim

bash:
	mv ~/.bashrc ~/.bashrc.bk
	ln -s $(DOTFILES)/.bashrc ~/.bashrc

emacs:
	ln -s $(DOTFILES)/.emacs ~/.emacs

vim:
	ln -s $(DOTFILES)/.vimrc ~/.vimrc
	mkdir ~/.vim
	mkdir ~/.vim/colors
	cp $(DOTFILES)/vim/colors/* ~/.vim/colors/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
	cd ~/.vim/bundle/command-t/; rake make
