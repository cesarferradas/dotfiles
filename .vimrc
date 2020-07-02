set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vimwiki/vimwiki'
call vundle#end()

filetype plugin indent on
syntax on

" COLOURS
set background=dark
set termguicolors
let g:quantum_italics=1
colorscheme quantum

" SETTINGS
set mouse=a
set number
set relativenumber
set nowrap
set autoread
set hidden
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set ignorecase
set smartcase
set autoindent
set expandtab
set textwidth=79
set tabstop=4
set shiftwidth=4
set shiftround
set wildmenu
set wildignore+=*htmlcov/*

" MAPPINGS
nnoremap <Esc> <Esc>:noh<CR>
vnoremap <C-c> "+y
inoremap <C-v> <Esc>:set paste<CR>"+pa<Esc>:set nopaste<CR>
nnoremap yo2 :setlocal expandtab shiftwidth=2 tabstop=2<CR>
nnoremap yo4 :setlocal expandtab shiftwidth=4 tabstop=4<CR>
nnoremap Q <Nop>

" INDENTATION OVERRIDES
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType jst setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType pug setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal expandtab shiftwidth=4 tabstop=4

" PLUGIN SETTINGS
let g:ale_linters={'python': ['flake8']}
let g:ale_set_highlights=0
let g:ale_sign_error = '!'
let g:netrw_banner=0
let g:python_highlight_all=1
let g:vimwiki_list=[{
    \ 'path': '~/vimwiki/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md'}]
let g:vimwiki_global_ext=0
