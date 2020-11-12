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

" Autocompletion and snippets
Plug 'neoclide/coc.nvim'
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
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'arcticicestudio/nord-vim'
Plug 'cormacrelf/vim-colors-github'

call plug#end()

""""""""""""""""""""
"       Theme      "
""""""""""""""""""""
" Syntax highlighting and theme
if (has("termguicolors"))
  set termguicolors
endif

syntax on

" night-owl
" colorscheme nightfly

" github
colorscheme github

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

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>f :FzfFiles<CR>
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

" coc.nvim settings from default example
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
