""""""""""""""""""""
"     Plugins      "
""""""""""""""""""""
"Vim Plug
call plug#begin('~/.vim/plugged')

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"Vim Utils
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/SearchComplete'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'

" Autocompletion and snippets
Plug 'Valloric/YouCompleteMe'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Emmet
Plug 'mattn/emmet-vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-xmark', { 'do': 'make' }

" Theme
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()

""""""""""""""""""""
"       Theme      "
""""""""""""""""""""
" Syntax highlighting and theme
syntax enable
set background=dark
set termguicolors
colorscheme quantum
let g:quantum_italics=1

" lightline settings
set laststatus=2
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
set linespace=2
set encoding=utf-8
set fileencoding=utf-8

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Enable mouse use in all modes
set mouse=a


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
nmap <Leader>t :Tags<CR>


""""""""""""""""""""
" Plugin settings  "
""""""""""""""""""""

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/*,*.so,*.swp,*.zip

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
