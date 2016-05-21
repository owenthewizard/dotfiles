" A lot of this is from...
" spf13's spf13-vim on GitHub (https://github.com/spf13)
" Frew on StackOverflow (https://stackoverflow.com/users/12448/frew-schmidt)
" Example vimrc on the Vim Wiki (http://vim.wikia.com/wiki/Example_vimrc)

" NOT ALL THIS CODE IS MINE
" CODE THAT IS NOT MINE IS NOT LICENSED UNDER CC0

"""""""""""""""""""""""""
" Visual/Style Settings "
"""""""""""""""""""""""""
set background=dark

if $TERM == "xterm-256color"
    set t_Co=256
else
    set t_Co=8
endif

set term=$TERM
syntax enable                   " Enable syntax highlighting
set number                      " Show line numbers
set ignorecase                  " Ignore case when searching
set autoindent                  " Automatically continue to indent on next line
set tabstop=4                   " Set tab width to x spaces
set softtabstop=4               " ^
set shiftwidth=4                " ^
set shiftwidth=4                " ^
set expandtab                   " Use spaces instead of tabs
set shiftround                  " Indent to next multiple of tab width
set nowrap                      " Never wrap lines
set backspace=indent,eol,start  " Allow backspacing line starts, etc.
set showcmd                     " Show current command (e.x. leader key)
set showmode                    " Show -- INSERT -- etc.
set pastetoggle=<F2>            " Enter past mode with <F2>
set showmatch					" Show matching brackets.
set ttyfast						" We're in $YEAR
set nostartofline               " Don't move cursor around
set autochdir                   " cd into the file's directory
set wildmenu                    " Command autocompletion
set wildmode=list:longest,full  " ^
"set spell                      " Uncomment to enable spell checking
"set undofile                   " Uncomment tokeep undo history in file 

""""""""""""""""""""""""""
" Compatibility Settings "
""""""""""""""""""""""""""
set noarabic                    " Comment this if you need arabic support
"set arabic                     " Uncomment this if you need arabic support
set nocompatible                " We're in $YEAR and not using vi
filetype plugin indent on       " Try and guess filetype
scriptencoding utf-8            " Set encoding

""""""""""""""""""""""""""
" Search Settings        "
""""""""""""""""""""""""""
set ignorecase                  " Ignore case when searching
set smartcase                   " ^unless you search with caps

""""""""""""""""""""""""""
" Backup Settings        "
""""""""""""""""""""""""""
"set backup						" Uncomment to enable backups
"set backupdir="/path/"			" Set backup directories
"set directory="/path/"			" ^
"set viewdir="/path/"			" ^
