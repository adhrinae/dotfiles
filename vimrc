"Vim Plug
call plug#begin('~/.vim/plugged')

"Git
Plug 'tpope/vim-fugitive'

"Syntax Highlighting
Plug 'sheerun/vim-polyglot'

"Rails/Ruby Plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-bundler'

"Vim Utils
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/SearchComplete'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'

" Autocompletion and snippets
Plug 'Valloric/YouCompleteMe'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Run test
Plug 'janko-m/vim-test'

"Dash
Plug 'rizzatti/dash.vim'
"Emmet
Plug 'mattn/emmet-vim'

" Markdown
Plug 'plasticboy/vim-markdown'

" Theme
Plug 'jpo/vim-railscasts-theme'
Plug 'lifepillar/vim-solarized8'

call plug#end()

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

au BufNewFile,BufRead *.handlebars set file type=html

" Syntax highlighting and theme
syntax enable

" Railscasts Theme
set background=dark
" colorscheme railscasts

" Solarized dark theme enhanced
colorscheme solarized8_dark

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

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
set guifont=Fira_Code:h14
set guifontwide=D2Coding:h14

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Enable mouse use in all modes
set mouse=a

" map Leader key to comma
let mapleader = ","

" Change space key's behavior
map <Space> :

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
" previous buffer
map <leader>jj :bp<CR>
" next buffer
map <leader>kk :bn<CR>
" delete buffer and move to previous buffer
nmap <leader>dd :bp <BAR> bd #<CR>
" Toggle BufferExplorer
nmap <leader>be :BufExplorer<CR>


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
nnoremap <F2> :set invpaste paste?<CR>

" Tab completion
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

" custom CtrlP ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the closest .git directory as a workspace
let g:ctrlp_working_path_mode = 'r'

" Shortcuts for CtrlP modes
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>pm :CtrlPMixed<CR>
nmap <leader>ps :CtrlPMRU<CR>

" Make NERDTree appears on the left side of Vim
let NERDTreeWinPos = "left"
filetype on

" Make Taglist appears on the right side of Vim
let Tlist_Use_Right_Window = 1

" Path of ctags for Taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
