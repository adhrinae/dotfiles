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

" Auto ime switch when back to NORMAL mode
Plug 'simnalamburt/vim-tiny-ime', { 'do' : './build' }

" Autocompletion and snippets
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Linter & Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Emmet
Plug 'mattn/emmet-vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-xmark', { 'do': 'make' }

" Theme
Plug 'morhetz/gruvbox'

call plug#end()

""""""""""""""""""""
"       Theme      "
""""""""""""""""""""
" Syntax highlighting and theme
syntax on
set background=dark
colorscheme gruvbox

" lightline settings
set laststatus=2
set showtabline=2
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>p :FzfFiles<CR>
nnoremap <Leader>gp :FzfGitFiles<CR>
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>g :FzfRg<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

" Prettier
nmap <Leader>t <Plug>(Prettier)


""""""""""""""""""""
" Plugin settings  "
""""""""""""""""""""

" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['scss'] = ['stylelint', 'prettier']
let g:ale_fix_on_save = 1 " Fix files automatically on save
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Move between linting errors
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
nmap <F6> <Plug>(ale_fix)

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

" Ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" vim pretty template
call jspretmpl#register_tag('html', 'javascript')

autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl

" emmet
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
