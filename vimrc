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
Plug 'Quramy/vim-js-pretty-template'
Plug 'leafgarland/typescript-vim'

" Vim Utils
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" Linter & Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

""""""""""""""""""""
"       Theme      "
""""""""""""""""""""
" Syntax highlighting and theme
if (has("termguicolors"))
  set termguicolors
endif

syntax on

" Nord
colorscheme nord

" lightline settings
set laststatus=2
set showtabline=2
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

" Add red block to trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

""""""""""""""""""""
"      Basic       "
""""""""""""""""""""
set nu
set noswapfile
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

" Prettier
nmap <Leader>t <Plug>(Prettier)


""""""""""""""""""""
" Plugin settings  "
""""""""""""""""""""
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/*,*.so,*.swp,*.zip

" Make NERDTree appears on the left side of Vim
let NERDTreeWinPos = "left"
filetype on

" vim pretty template
call jspretmpl#register_tag('html', 'javascript')

autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
