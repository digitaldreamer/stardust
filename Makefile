ALL=bash emacs vim
DOTFILES=~/dotfiles

.PHONY: $(ALL)

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
