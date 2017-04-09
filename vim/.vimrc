set nocompatible
set ttyfast
set background=dark
set term=$TERM
set backspace=indent,eol,start
set autochdir
set showmode
set showcmd
set showmatch
set incsearch
set ignorecase
set smartcase
set nostartofline
set noarabic
set confirm
set nohlsearch

" Use Xresources colors
colo default
set t_Co=16

syntax on
set autoindent
set shiftwidth=4
set shiftround
set expandtab
set tabstop=4
set softtabstop=4

set pastetoggle=<F3>

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
    fi
endfunction
