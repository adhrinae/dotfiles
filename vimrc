""""""""""""""""""""
"     Plugins      "
""""""""""""""""""""
" Vim Plug
call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax Highlighting & Language supports
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Vim Utils
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" Autocompletion and snippets
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Emmet
Plug 'mattn/emmet-vim'

" Markdown
Plug 'plasticboy/vim-markdown'
  Plug 'junegunn/vim-xmark', { 'do': 'make' }

" Theme
Plug 'lifepillar/vim-solarized8'

call plug#end()

""""""""""""""""""""
"       Theme      "
""""""""""""""""""""
" Syntax highlighting and theme
syntax enable
set background=dark
set termguicolors
colorscheme solarized8_flat

" lightline settings
set laststatus=2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': [['lineinfo'], ['percent'], ['readonly']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Add red block to trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/


""""""""""""""""""""
"      Basic       "
""""""""""""""""""""
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

" Relative numbers
set number relativenumber

" Macvim can access system clipboard as the register
set clipboard=unnamed
" Macvim font setting
set guifont=Fira\ Code:h14
set linespace=2
set encoding=utf-8
set fileencoding=utf-8

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Enable mouse use in all modes
set mouse=a

" Python3 hotfix
if has('python3')
  silent! python3 1
endif

""""""""""""""""""""
"      Keymaps     "
""""""""""""""""""""
" map Leader key to comma
let mapleader = ","

" Change space key's behavior
map <Space> :

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Toggle NERDTree
map <leader>q :NERDTreeToggle<CR>

" Add escape like behavior
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

" fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>gp :GitFiles<CR>

" Prettier
nmap <Leader>t <Plug>(Prettier)

""""""""""""""""""""
" Plugin settings  "
""""""""""""""""""""

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/*,*.so,*.swp,*.zip

" Make NERDTree appears on the left side of Vim
let NERDTreeWinPos = "left"
filetype on

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
