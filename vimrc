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
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'

"Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'

"Vim Utils
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/SearchComplete'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim'

" Autocompletion and snippets
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

"Run test
Plugin 'janko-m/vim-test'

"Dash
Plugin 'rizzatti/dash.vim'
"Emmet
Plugin 'mattn/emmet-vim'

" Markdown
Plugin 'plasticboy/vim-markdown'

" Theme
Plugin 'jpo/vim-railscasts-theme'

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
colorscheme railscasts

set laststatus=2
let g:airline_powerline_fonts = 1

highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set nu
let g:netrw_liststyle=3

set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
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
set guifont=Hack:h15
set guifontwide=D2Coding:h14

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Enable mouse use in all modes
set mouse=a

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

" moving rows
noremap j gj
noremap k gk

" Set // to search the current visual selection
vnoremap // y/<C-R>"<CR>"

" next/prev quicklist item
nmap <c-b> :cprevious<CR>
nmap <c-n> :cnext<CR>

" toggle paste in cmd only
nnoremap <Leader>p :set invpaste<CR>

"Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/*,*.so,*.swp,*.zip

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim-test shortcuts
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" CtrlP custom ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'

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

