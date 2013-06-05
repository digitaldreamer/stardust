" All UTF-8 all the time
scriptencoding utf-8
set encoding=utf-8

" Initialize Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'majutsushi/tagbar'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
"Bundle 'msanders/snipmate.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'taglist.vim'
"Bundle 'PickAColor.vim'
"Bundle 'BufOnly.vim'
"Bundle 'FuzzyFinder'
""Bundle 'ervandew/supertab'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'groenewege/vim-less'
"Bundle 'digitaltoad/vim-jade'
""Bundle 'CSApprox.vim'
""Bundle 'statusline.vim'
"Bundle 'wavded/vim-stylus'
"Bundle 'Lokaltog/vim-powerline'

" OPTIONS
"set autosave
set guioptions-=T
set hidden
set hlsearch
set incsearch
set number
set ruler

set wildmode=list:longest,full

" TABS
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Enable filetype-specific indenting, and plugins
filetype plugin indent on

" COLORS
syntax on
colorscheme slate
set background=light
set background=dark

" KEY BINDINGS
nnoremap <silent> <C-l> :nohl<CR><C-l>

" FILE TYPES
filetype on
