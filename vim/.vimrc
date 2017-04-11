set nocompatible
set autochdir
set background=dark
set backspace=indent,eol,start
set confirm
set ignorecase
set incsearch
set modeline
set modelines=1
set noarabic
set nohlsearch
set nostartofline
set showcmd
set showmatch
set showmode
set smartcase
set term=$TERM
set ttyfast

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

set pastetoggle=<F3>

syntax on
" Use Xresources colors
colo default
set t_Co=16

filetype plugin indent on
scriptencoding utf-8

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
endif

if has('statusline')
    set laststatus=2
    set statusline=%f\%h%m%r%w[%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc},%{&fileformat}]%=\ [F3]\ Paste\ Mode:\ %{Paste_Status()}\ \ \%-14.(%l,%c%V%)\ %<%P
endif

"if $TERM =~ "256color"
"    set t_Co=256
"elseif $TERM =~ "color"
"    set t_Co=16
"else
"    set t_Co=8
"endif

function! Paste_Status()
    if ! &list && ! &ai
        return "on"
    else
        return "off"
    endif
endfunction
