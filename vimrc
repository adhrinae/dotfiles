set nocompatible
filetype off

"번들 설치
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"기본 설치
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'

"레일즈 관련
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

syntax enable

"Macvim font setting
set gfn=Menlo:h15

set background=dark
highlight Normal ctermfg=grey ctermbg=black
let g:monokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme monokai

"air-line이 상단바에도 등장
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2

:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set nu
let g:netrw_liststyle=3

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set noimd
set imi=1
set ims=-1

set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
