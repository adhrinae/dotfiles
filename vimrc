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

"Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'

"Vim Utils
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/SearchComplete'
Plugin 'vim-scripts/AutoComplPop'

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

"Dependencies of snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

" Markdown
Plugin 'plasticboy/vim-markdown'

" Theme
" Molokai theme
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END
" ================

" Syntax highlighting and theme

syntax enable

" Configs to make Molokai look great
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

set laststatus=2
let g:airline_powerline_fonts = 1

highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set nu
let g:netrw_liststyle=3

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" Macvim can access system clipboard as the register
set clipboard=unnamed
" Macvim font setting
set linespace=2
set encoding=utf-8
set fileencoding=utf-8
set guifont=Hack:h16
set guifontwide=D2Coding:h14

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" map Leader key to comma
let mapleader = ","
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Toggle NERDTree
map <leader>q :NERDTreeToggle<CR>

" Removing escape
ino jk <esc>
cno jk <c-c>
vno v <esc>

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

"ignorelist for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
