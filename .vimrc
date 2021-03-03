set nu
set relativenumber
set clipboard=unnamed
set noerrorbells
set belloff=all
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set autowrite
set tabstop=4 softtabstop=4 shiftwidth=4 smarttab
set expandtab
set autoindent
set fileformat=unix
set colorcolumn=80
set scrolloff=8
let mapleader = " "


" Uncomment the following to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""" CoC Initial Configurations
set hidden 
set cmdheight=2 
set updatetime=300 
set shortmess+=c 
set signcolumn=yes

call plug#begin()
Plug 'fatih/vim-go', { 'do' : 'GoInstallBinaries' }
Plug 'neoclide/coc.nvim'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'ayu-theme/ayu-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'codechips/coc-svelte', { 'do': 'npm install' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

""" Prettier config
let g:prettier#quickfix_enabled = 0


""" Ale remove mypy linting for now.
let g:ale_linters = {
            \ 'python': ['flake8', 'pyright', 'pylint'],
            \}
""" Django development
let g:ale_python_pylint_options = '--load-plugins pylint_django'

""" Color Scheme & color override
set termguicolors " Needed for that beautiful... beautiful ayu colorscheme
colorscheme ayu " the best color scheme
highlight LineNr guifg=orange
highlight Search guibg=yellow guifg=black


""" file & buffer search 
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

""" Go Commands
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>r <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

""" TODO: Git Shortcuts w/ Fugitive


" Not sure wha tthis is for....
highlight SignColumn ctermbg=black
hi clear CursorLine
augroup ClClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END


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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
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
" auto-import
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
