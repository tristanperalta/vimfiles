" Use vim settings, rather than vi settings
set shell=/bin/bash
set nocompatible
set encoding=utf-8

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()

Bundle 'gmarik/vundle'

" Bundles
" sort by plugin name :16,39s/\/.*$ r
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/matchit.zip'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'itspriddle/vim-jquery'
Bundle 'slack/vim-l9'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'plasticboy/vim-markdown'
Bundle 'junegunn/vim-easy-align'

call vundle#end()
filetype plugin indent on

" Change the mapleader to '-' (It's easier in Dvorak keyboard layout)
let mapleader = "-"

vmap <Enter> <Plug>(EasyAlign)

" Editing behavior {{{
set shiftround
set backspace=indent,eol,start
set smarttab
set autoindent
set copyindent
set mouse=a
set wrap

" searching and moving

" See http://stevelosh.com/blog/2010/09/coming-home-to-vim/ for details
nnoremap / /\v
vnoremap / /\v

set showmatch
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

nnoremap <leader><space> :nohl<CR>

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set smartcase
set expandtab

set listchars=tab:▸\ ,eol:¬,trail:·,extends:#,nbsp:·
" }}}

" Folding rules {{{
set foldenable
set foldcolumn=2
set foldmethod=marker
set foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
  return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()
" }}}

" Editor layout {{{
"
set colorcolumn=80
set laststatus=2
set number
if ("gui_running")
  set lines=40
  set columns=120
endif
" }}}

" Vim behavior {{{
syntax on
set hidden
set history=1000
set undolevels=1000

set nobackup
set noswapfile
" store swap files in one of these directories
" in case swap file is ever turned on
set directory=~/.vim/.tmp,~/tmp,/tmp

set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set showmode
set showcmd

" }}}

" Shortcut mappings {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap ! :!

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

noremap <C-Tab> :MBEbn<CR>
noremap <C-S-Tab> :MBEbp<CR>
noremap <C-l> :MBEbn<CR>
noremap <C-h> :MBEbp<CR>
noremap Y y$

" Ctrl-s like windows
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

" Edit .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Yank/Paste to the OS clipboard with -y and -p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

"Folding
nnoremap <Space> za
vnoremap <Space> za

" Insert new line without entering instert mode
map <S-Enter> o<Esc>k

" Ctags shortcuts
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Reindent file
map <Leader>i mmgg=G`m<CR>

noremap <leader>d <Esc>:MBEbd<CR>

" }}}

" DelimitMate settings {{{
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_space = 1
let delimitMate_excluded_regions = "Comments"
" }}}

" CtrlP settings {{{
let g:ctrlp_map = '<Leader>o'
noremap <leader>b <Esc>:CtrlPBuffer<CR>

map <F4> :CtrlPClearCache<CR>
imap <F4> <Esc>:CtrlPClearCache<CR>i

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

:helptags $HOME/.vim/bundle/ctrlp.vim/doc
" }}}

" NERDTree settings {{{
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursor=1
noremap <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Snipmate {{{
let g:snippets_dir="~/.vim/snippets/"
" }}}

" Fugitive settings {{{
autocmd BufReadPost fugitive://* set bufhidden=delete

nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

"}}}

" Ack settings {{{
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack
" }}}

" Easymotion settings {{{
let g:EasyMotion_keys="aoeuidhtnspkgm"
" }}}

" Filetype specific handling {{{
if has("autocmd")
  autocmd BufNewFile,BufRead *.html,*.erb set filetype=html.eruby

  augroup invisible_chars " {{{
    au!
    " show invisible characters in all of these files
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd filetype vim set expandtab
    autocmd filetype vim setlocal list
    autocmd filetype python,rst setlocal list
    autocmd filetype ruby setlocal list
    autocmd filetype javascript,css setlocal list
    autocmd filetype php setlocal list
  augroup end " }}}

  augroup vim_files " {{{
    au!
    " bind <F1> to show the keyword under cursor
    " general help can still be entered manually with :h
    autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>

    " Reload settings when changed
    autocmd BufWritePost .vimrc source $MYVIMRC
  augroup end " }}}

  augroup bash_files " {{{
    au!
    autocmd filetype bash set shiftwidth=1 softtabstop=2 expandtab

  augroup end " }}}

  augroup ruby_files " {{{
    au!
    " autoindent with two spaces, always expand tabs
    autocmd filetype ruby,eruby,yaml set shiftwidth=2 softtabstop=2 expandtab
    autocmd BufReadPre *.prawn,Guardfile,Capfile,config.ru,Thorfile,Rakefile,Gemfile,*.rabl set ft=ruby
  augroup end " }}}

  augroup php_files " {{{
    au!
    autocmd filetype ctp set filetype=php.html set expandtab
  augroup end " }}}

  augroup coffeescript_files " {{{
    au!
    autocmd BufNewFile,BufReadPre *.coffee noremap <f9> :CoffeeRun<CR>
  augroup end " }}}

  augroup javascript_files " {{{
    au!
    autocmd BufNewFile,BufReadPre *.js set shiftwidth=2 softtabstop=2 expandtab
  augroup end " }}}

  augroup coffee_files " {{{
    au!
    autocmd BufNewFile,BufReadPre *.coffee set ft=coffee
  augroup end " }}}

  augroup haml_files " {{{
    au!
    autocmd BufNewFile,BufReadPre *.hamlc set ft=haml
  augroup end " }}}

  augroup markdown_files " {{{
    au!
    autocmd BufNewFile,BufReadPre *.md,*.markdown set ft=markdown wrap
  augroup end " }}}

endif
" }}}

" Extra {{{
set t_Co=256
colorscheme Tomorrow-Night-Bright

if has("gui_running")
  set guifont=Inconsolata\ 11
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif
"}}}
