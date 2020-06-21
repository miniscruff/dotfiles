filetype indent plugin on

syntax on

call plug#begin('~/.vim/plugged')
" General
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" COC plugins to install:
" coc-tsserver coc-go coc-css coc-html coc-yaml coc-json
" Languages
Plug 'sheerun/vim-polyglot'
" Misc
Plug 'luochen1990/rainbow'
Plug 'inside/vim-search-pulse'
Plug 'ryanoasis/vim-devicons'
call plug#end()

nnoremap <Space> <Nop>
let mapleader = " "

nnoremap ; :
nnoremap q; q:

" Map escape in terminal to go to normal
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>b :buffers<cr>:b<space>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>q :b#<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>r :%s//g<left><left>
nnoremap <leader>d :g//d<left><left>

nnoremap <leader>mo :copen<cr>
autocmd FileType py nnoremap <leader>mb :!black<space>%<cr>

nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
nnoremap <c-j> :<c-u>exe ":m.+".v:count1<cr>
nnoremap <c-k> :<c-u>exe ":m.-".(v:count1+1)<cr>
nnoremap <c-l> J$

map ^ <nop>
map { <nop>
map } <nop>
map $ <nop>

nnoremap H ^
nnoremap J }
nnoremap K {
nnoremap L $
nnoremap Y y$

set guifont=Hack:h11
set noeb
set rnu
set nu
set noswapfile
set enc=utf-8
set wildignore+=venv,*__pycache__*,*.swp,*.exe,*.pyc,*/tmp*,node_modules,*.db,*egg-info,*wheel-metadata
set clipboard+=unnamedplus
set nowrap
set showmatch
set showcmd
set cursorline
set hlsearch
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set go-=m
set go-=T
set fileformat=unix
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitright
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

au BufNewFile,BufRead *.js,*.html,*.css,*.vue,*.yml,*.yaml,*.ts,*.json,*.tsx
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.rst
    \ set tabstop=3 |
    \ set softtabstop=3 |
    \ set shiftwidth=3

au BufNewFile,BufRead *.go
    \ set noexpandtab

" Misc plugins
let NERDTreeRespectWildIgnore=1
let g:rainbow_active = 1

" Pythong
let python_highlight_all = 1
let g:python_host_prog = systemlist('which python')[0]
let g:python3_host_prog = systemlist('which python3')[0]

" Colors
set termguicolors
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_number_column = 'bg1'
let g:gruvbox_color_column = 'purple'
let g:gruvbox_vert_split = 'blue'
colorscheme gruvbox
hi User1 ctermfg=007 ctermbg=239 guibg=#32302f guifg=#8ec07c
hi User2 ctermfg=236 ctermbg=236 guibg=#504945 guifg=#d5c4a1
set background=dark

" status line
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '  '.fugitive#head().' '
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%1*%{GitInfo()}
set statusline+=%2*\ %f%m%r%h%w
set statusline+=%=
set statusline+=\ %l/%L\ :\ %c

" display tabs and trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uD7,nbsp:~"
set list
