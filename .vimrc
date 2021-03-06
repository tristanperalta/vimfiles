" Use vim settings, rather than vi settings
set shell=/bin/bash
set nocompatible
set encoding=utf-8

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.config/nvim/bundle directory
filetype off

call plug#begin('~/.config/nvim/plugged')

" Plugins
" sort by plugin name :17,43s/\/.*$ sort
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/matchit.zip'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'msanders/snipmate.vim'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'slack/vim-l9'
Plug 'rafi/vim-tinyline'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'chase/vim-ansible-yaml'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-rails'
Plug 'wting/rust.vim'

call plug#end()
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
let g:vim_markdown_folding_disabled = 1
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
set laststatus=2
set number
set cmdheight=2
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

map <F5> :!make<CR>
imap <F5> <Esc>:!make<CR>i

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

noremap <C-Tab> :MBEbn<CR>
noremap <C-S-Tab> :MBEbp<CR>
noremap <C-n> :MBEbn<CR>
noremap <C-p> :MBEbp<CR>
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

noremap <leader>d <Esc>:bdel<CR>

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
let g:ack_default_options = " --ignore-dir=log/"
nnoremap <leader>a :Ack
" }}}

" Easymotion settings {{{
let g:EasyMotion_keys="aoeuidhtnspkgm"
" }}}

" Filetype specific handling {{{
if has("autocmd")
  autocmd BufNewFile,BufRead *.html,*.erb,*.handlebars set filetype=html.eruby

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

autocmd Filetype swift setlocal tabstop=4 shiftwidth=4 expandtab
