set nocompatible
filetype off

let g:polyglot_disabled = ['autoindent']

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plugin 'rescript-lang/vim-rescript'
Plugin 'sheerun/vim-polyglot'
Plugin 'dracula/vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
call vundle#end()

filetype plugin indent on
syntax on

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
set shiftwidth=4
set shiftround
set wildmenu
set wildignore+=*htmlcov/*,**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp,*.bs.js

" MAPPINGS
nnoremap <Esc> <Esc>:noh<CR>
vnoremap <C-c> "+y
inoremap <C-v> <Esc>:set paste<CR>"+pa<Esc>:set nopaste<CR>
nnoremap Q <Nop>
nnoremap <Space> <Nop>
cnoreabbrev t tabe
cnoreabbrev Gb Git blame
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Buffers<CR>

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
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = []
let $FZF_DEFAULT_COMMAND="rg --files --fixed-strings -g '!__generated__' -g '!*bs.js'"

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
