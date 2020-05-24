syntax on

set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=2
set colorcolumn=100

highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin("~/.vim/plugged")

Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'morhetz/gruvbox'

call plug#end()

autocmd vimenter * colorscheme gruvbox
set background=dark
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = 'C:/Python38/python'
let g:loaded_python_provider = 0
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',]
" coc.nvim configuration
set cmdheight=2
set hidden
set shortmess+=c
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap jk <ESC>


