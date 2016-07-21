set nocompatible
filetype off

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Basic
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'

"Rails/Ruby Plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-projectionist'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lucapette/vim-ruby-doc'

"Vim Utils
Plugin 'scrooloose/nerdtree'
Plugin 'AutoComplPop'
Plugin 'vim-scripts/SearchComplete'

"Taglist Requires 'ctags' package
Plugin 'taglist-plus'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim'

"Dash
Plugin 'rizzatti/dash.vim'
"Zeal
Plugin 'KabbAmine/zeavim.vim'

"Dependencies of snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"Theme
Plugin 'tomasr/molokai'
Plugin 'crusoexia/vim-monokai'

call vundle#end()
syntax on
filetype plugin indent on

"Vim basic
syntax enable

set nu
let g:netrw_liststyle=3

set smartindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set scrolloff=2
set expandtab

set noimd
set imi=1
set ims=-1

set hlsearch
set incsearch
set ignorecase
set smartcase

"Custom Keybindings
nmap ; :
let mapleader = "\<Space>"

"Macvim font setting
set guifont=Hack 15

"Theme
set background=dark
highlight Normal ctermfg=grey ctermbg=black
let g:monokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

"Airline
set laststatus=2
let g:airline_powerline_fonts=1

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

"Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

"highlight the current line
set cursorline
"Highlight active column
set cuc cul"

"Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"Make NERDTree appears on the left side of Vim
let NERDTreeWinPos = "left"
filetype on

"Make Taglist appears on the right side of Vim
let Tlist_Use_Right_Window = 1
"Path of ctags for Taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0

