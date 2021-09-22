filetype indent plugin on

syntax on

call plug#begin('~/.vim/plugged')
" General
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-tsserver coc-go coc-css coc-html coc-yaml coc-json

Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript'],
    \ 'do': 'make install'
\}

" Languages
Plug 'sheerun/vim-polyglot'
" Plug 'fatih/vim-go' " try coc-go
" Misc
Plug 'luochen1990/rainbow'
Plug 'inside/vim-search-pulse'
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

nnoremap <leader>gg :Ggrep<space>
" grep word will yank and ggrep the next word
nnoremap <leader>gw yw:Ggrep<space><C-r>"<cr>

nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
nnoremap <c-j> :<c-u>exe ":m.+".v:count1<cr>
nnoremap <c-k> :<c-u>exe ":m.-".(v:count1+1)<cr>
nnoremap <c-l> J$
nnoremap <c-n> :cn<cr>

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
set noshowmode

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

" Python
let python_highlight_all = 1
let g:python_host_prog = systemlist('which python')[0]
let g:python3_host_prog = systemlist('which python3')[0]

" Go
" let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_doc_keywordprg_enabled = 0
" let g:go_auto_sameids = 0
" let g:go_metalinter_enabled = []
" let g:go_metalinter_autosave_enabled = []
" let g:go_highlight_trailing_whitespace_error = 1
" let g:go_test_show_name = 1
" let g:go_auto_type_info = 1
" au FileType go nnoremap <leader>gd :GoDoc<cr>
" au FileType go nnoremap <leader>gf :GoDef<cr>
" au FileType go nnoremap <leader>ga :GoAlt<cr>
" au FileType go nnoremap <leader>gi :GoImport<space>
" au FileType go nnoremap <leader>gl :GoMetaLinter<cr>
" au FileType go nnoremap <leader>ge :GoErrCheck<cr>
" au FileType go nnoremap <leader>gt :GoTest<cr>
" au FileType go nnoremap <leader>gb :GoBuild<cr>
" au FileType go nnoremap <leader>gr :GoRun<cr>

" coc settings
" GoTo code navigation.
nmap <silent> <leader>gf <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader><up> <Plug>(coc-diagnostic-prev)
nmap <silent> <leader><down> <Plug>(coc-diagnostic-next)

nnoremap <silent> <c-space> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Colors
set background=dark
set termguicolors
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_number_column = 'bg1'
let g:gruvbox_color_column = 'purple'
let g:gruvbox_vert_split = 'blue'
colorscheme gruvbox

" Git Branch
function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '  '.fugitive#head().' '
  else
    return ''
endfunction

" Status Line
set laststatus=2
set statusline=
set statusline+=%1*\ %{GitInfo()}\         " Git branch
set statusline+=%0*\ %f%m%r%h%w            " File path and modified
set statusline+=%=                         " Right side
set statusline+=%2*\ %l/%L\ :%c\           " line number / total lines
set statusline+=%3*\ %{StatuslineMode()}\  " Current mode
hi User1 ctermbg=black ctermfg=green guibg=#303030 guifg=green
hi User2 ctermbg=black ctermfg=white guibg=#303030 guifg=white
hi User3 guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
au InsertEnter * hi User3 guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi User3 guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

" display tabs and trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uD7,nbsp:~"
set list
