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
Plug 'rescript-lang/vim-rescript'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'
call plug#end()

" COLOURS
set background=dark
set termguicolors
colorscheme dracula

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
set tabstop=4
set ignorecase
set smartcase
set shiftwidth=4
set shiftround
set wildmenu
set wildignore+=htmlcov/,.git/,__pycache__/,__generated__/,node_modules/,*.o,*.pyc,*.swp,*.bs.js

" MAPPINGS
nnoremap <Esc> <Esc>:noh<CR>
vnoremap <C-c> "+y
inoremap <C-v> <Esc>:set paste<CR>"+pa<Esc>:set nopaste<CR>
nnoremap Q <Nop>
nnoremap <Space> <Nop>
cnoreabbrev t tabe
cnoreabbrev Gb Git blame
cnoreabbrev F Rg
nnoremap <C-P> :Files<CR>
nnoremap ; :Buffers<CR>
nnoremap F :Rg<space>

" DEFAULTS OVERRIDES
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType rescript setlocal shiftwidth=2 tabstop=2

" PLUGIN SETTINGS
let g:python_highlight_all=1
let g:netrw_banner=0
let g:ale_linters_explicit = 1
let g:ale_javascript_eslint_executable = 'healthier'
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_warning = '•'
let g:ale_sign_info = '•'
let g:ale_sign_error = '•'
let g:ale_virtualtext_cursor = 0
let g:ale_set_highlights=0
let g:fzf_layout = { 'down': '40%' }
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = []
let $FZF_DEFAULT_COMMAND="rg --files --fixed-strings -g '!__generated__' -g '!*bs.js'"
