set nocompatible
filetype off

let plug_location = '~/.vim/autoload/plug.vim'
if empty(glob(plug_location))
  silent execute '!curl -fLo '.plug_location.' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
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
nnoremap <C-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" :help E669 or guifg
highlight PreProc guifg=NvimLightMagenta
highlight Operator guifg=NvimLightMagenta
highlight Type guifg=NvimLightYellow
highlight Constant guifg=NvimLightRed

" PLUGIN SETTINGS
let g:netrw_banner=0
let g:python_highlight_all = 1
let g:fzf_layout = { 'down': '50%' } " { 'window': 'enew' }
let g:fzf_vim_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'rg --files --fixed-strings'

" coc.nvim
" Use tab for trigger completion
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
" Better floating window colours
highlight CocMenuSel guibg=NvimDarkGray4
highlight CocFloating guibg=NvimDarkGray2
