set nocompatible
filetype off

let plug_location = '~/.vim/autoload/plug.vim'
if empty(glob(plug_location))
  silent execute '!curl -fLo '.plug_location.' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'
call plug#end()

" COLOURS
set background=dark
set termguicolors
colorscheme default

" SETTINGS
set encoding=utf-8
set mouse=a
set number
set nowrap
set nobackup
set nowritebackup
set noswapfile
set autoread
set hidden
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set autoindent
set expandtab
set updatetime=500
set smartcase
set shiftround
set wildmenu
set wildignore+=htmlcov/,.git/,__pycache__/,__generated__/,node_modules/,*.o,*.pyc,*.swp,*.bs.js

" MAPPINGS
nnoremap <Esc> <Esc>:noh<CR>
vnoremap <C-c> "+y
inoremap <C-v> <Esc>:set paste<CR>"+pa<Esc>:set nopaste<CR>
nnoremap Q <Nop>
nnoremap <Space> <Nop>
cnoreabbrev Gbl Git blame
cnoreabbrev Gd Gvdiffsplit
cnoreabbrev Cf let @+=expand("%")<CR>
cnoreabbrev Cd let @+=expand("%:h")<CR>
nnoremap <C-P> :Files<CR>
nnoremap ; :Buffers<CR>
nnoremap F :Rg<space>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>
nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <silent> gr :ALEFindReferences<CR>

" :help E669 or guifg
highlight PreProc guifg=NvimLightMagenta
highlight Operator guifg=NvimLightMagenta
highlight Type guifg=NvimLightYellow
highlight Constant guifg=NvimLightRed

" PLUGIN SETTINGS
let g:netrw_banner=0
let g:python_highlight_all = 1
let g:ale_echo_msg_format = '[%linter%] %code %%s'
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_linters = { 'python': ['ruff', 'mypy', 'pyright'] }
let g:ale_python_pyright_config = {'python': {'analysis': {'typeCheckingMode': 'off'}}}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['ruff_format', 'ruff']
\}
let g:ale_virtualtext_cursor = 0
let g:ale_set_highlights = 0

let g:fzf_layout = { 'down': '50%' } " { 'window': 'enew' }
let g:fzf_vim_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'rg --files --fixed-strings'
