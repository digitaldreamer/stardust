" KEY BINDINGS
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap K <Esc>i<Enter><Esc>

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
Bundle 'L9'
Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
"Bundle 'msanders/snipmate.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'taglist.vim'
"Bundle 'PickAColor.vim'
"Bundle 'BufOnly.vim'
Bundle 'FuzzyFinder'
""Bundle 'ervandew/supertab'
"Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
"Bundle 'digitaltoad/vim-jade'
""Bundle 'CSApprox.vim'
""Bundle 'statusline.vim'
"Bundle 'wavded/vim-stylus'
"Bundle 'Lokaltog/vim-powerline'

" BACKUPS AND DIRECTORIES
set directory=~/.vim/tmp "where to put swap files
set backupdir=~/.vim/backup "where to put backups
set viewdir=~/.vim/view
set autoread "re-read files when they're changed externally
set nobackup
set nowritebackup
set noswapfile

" Vim 7.3 and newer can persist undo history across sessions
if v:version >= 703
    set undofile
    set undodir=~/.vim/tmp
endif

" OPTIONS
"set autosave
set guioptions-=T
set hidden
set number
set ruler
set wrap
set clipboard+=unnamed "yanks and pastes use the clipboard instead
set foldlevelstart=99 "no folds, please
set timeoutlen=250 "time to wait for a command (after leader, for example)
set showmatch "show matching brackets
set matchtime=2 "how many tenths of a second to blink
set gcr=n:blinkon0 "turn off blinking cursor in normal mode

" SEARCHING
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault "assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan "searches wrap around the end of the file

" TAB COMPLETION
set wildmode=list:longest,full
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*
set wildignore+=*/tmp/*
set wildignore+=sass-cache/*,.sass-cache/*,*.scssc
set wildignore+=*/media/*,*/html/*,*/source/media/*
set infercase "ignore case on insert completion

" Show current line in current window only
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Automatically strip trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e

" TABS AND SPACING
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set autoindent
set smartindent
set shiftround

"autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Enable filetype-specific indenting, and plugins
filetype plugin indent on
syntax on

" MODELINES
set modeline
set modelines=5

" COLORS AND FONTS
colorscheme ir_black
set guifont=Menlo:h12
set linespace=1
set antialias

" Indenting: Bind command-[ and command-] to shift left and right
nmap <D-]> >>
nmap <D-[> <<
vmap <D-]> >>
vmap <D-[> <<
imap <D-]> <C-t>
imap <D-[> <C-d>

" Command + return for fullscreen
"macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

" Window Navigation
nmap <D-J> <C-W>j
nmap <D-K> <C-W>k
nmap <D-H> <C-W>h
nmap <D-L> <C-W>l

" FILE TYPES
filetype on

" MacVIM shift+arrows to select behavior. Required in .vimrc instead of
" .gvimrc for some reason.
let macvim_hig_shift_movement=1

" Window management
set splitbelow "open new horizontal splits below the current
set splitright "open new veritcal splits to the right of the current

" Language-specific settings
"autocmd FileType,BufEnter,BufWinEnter python,javascript,coffee,css,less,scss set expandtab tabstop=4 shiftwidth=4 softtabstop=4 "textwidth=79 "PEP0008 compliance
"autocmd FileType,BufEnter,BufWinEnter ruby,html,django,eruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType,BufEnter,BufWinEnter django set ft=django.html
"autocmd FileType,BufEnter,BufWinEnter eruby set ft=eruby.html
"autocmd FileType,BufEnter,BufWinEnter css,less set ft=less.css
"autocmd FileType,BufEnter,BufWinEnter scss set ft=scss.css
"autocmd FileType,BufEnter,BufWinEnter jade set expandtab tabstop=2 shiftwidth=2 softtabstop=2
"autocmd BufRead,BufNewFile *.json set ft=javascript

" Statusline
""set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P "default statusline
"set statusline=%<%f%(\ %h%m%r%w%q%)
"set statusline+=%(\ (%{&ff})%)
"set statusline+=%=
"set statusline+=%-19.{fugitive#statusline()}\ %-14.(%l,%c%V%)\ %P

" Enable the mouse in terminal Vim (if supported). In OS X iTerm provides
" this functionality.
set mouse=a

" PLUGIN CONFIGURATION
let mapleader=','

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDChristmasTree=1 "colorize
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeHijackNetrw=1 "sure, hijack netrw
let NERDTreeIgnore=['\.$', '\~$', '\.git$', '\.pyc$', '\.DS_Store$', '\.tgz$', '\.gz$', '\.zip$', '\.o$', '\.png$', '\.jpg$', '\.jpeg$', '\.gif$', '\.bmp$', '\.mov$', '\.mp4$', '\.mp3$', '\.webm$', '\.ogg$', '\.ogv$', '\.swf$']

" NERDCommenter
let NERDSpaceDelims=1 "number of spaces to add before comments

" Auto-compile CoffeeScript on save
"autocmd BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!

" Syntastic
map <Leader>e :Errors<CR>
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2

" Statusline.vim
"let g:statusline_fugitive=1
"let g:statusline_fullpath=0

" Syntastic/PyFlakes
" We have to run a mini Python script here to append 'site-packages' to the Python
" path at runtime.
if has('python')
python << EOF
import os, sys, vim
sys.path.append('/usr/local/lib/python2.7/site-packages')
EOF
endif
