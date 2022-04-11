set nocompatible
filetype off

let g:polyglot_disabled = ['autoindent']

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
call vundle#end()

filetype plugin indent on
syntax on

" COLOURS
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" SETTINGS
set encoding=utf-8
set mouse=a
set number
set nowrap
set autoread
set hidden
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set path+=**
set wildmenu
set wildignore+=*htmlcov/*,**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp

" MAPPINGS
nnoremap <Esc> <Esc>:noh<CR>
vnoremap <C-c> "+y
inoremap <C-v> <Esc>:set paste<CR>"+pa<Esc>:set nopaste<CR>
nnoremap <C-p> :e<Space>
nnoremap Q <Nop>

" DEFAULTS OVERRIDES
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2

" PLUGIN SETTINGS
let g:ale_linters={
\   'javascript': ['standard'],
\   'typescriptreact': ['prettier'],
\   'python': ['flake8', 'mypy']
\}
let g:ale_fixers={
\   'javascript': ['standard'],
\   'typescriptreact': ['prettier'],
\   'python': ['black', 'isort']
\}
let g:ale_fix_on_save=1
let g:ale_set_highlights=0
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:python_highlight_all=1
let g:netrw_banner=0
let g:notes_directories = ['~/Notes']
