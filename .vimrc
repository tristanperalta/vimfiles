" Use vim settings, rather than vi settings
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Change the mapleader to '-' (It's easier in Dvorak keyboard layout)
let mapleader = "-"

" Editing behavior {{{
set shiftround
set backspace=indent,eol,start
set smarttab
set autoindent
set copyindent
set mouse=a

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
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set smartcase

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
set laststatus=2
set number
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
nnoremap ; :

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

noremap <C-h> :bp<CR>
noremap <C-l> :bn<CR>
noremap <C-d> :bd<CR>

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

" Quickly get out of insert mode
inoremap jj <Esc>

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

"Folding
nnoremap <Space> za
vnoremap <Space> za
" }}}

" FuzzyFinder settings {{{
noremap <leader>o <Esc>:FufCoverageFile<CR>
" }}}

" TagBar settings {{{
let g:tagbar_usearrow = 1
noremap <leader>g :TagbarToggle<CR>
" }}}

" NERDTree settings {{{
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursor=1
noremap <leader>t :NERDTreeToggle<CR>
" }}}

" Ack settings {{{
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack
" }}}

" Filetype specific handling {{{
if has("autocmd")
    augroup invisible_chars " {{{
        au!
        " show invisible characters in all of these files
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
    augroup end " }}}

    augroup ruby_files " {{{
        au!
        " autoindent with two spaces, always expand tabs
        autocmd FileType ruby,eruby,yaml set sw=2 sts=2 et
    augroup end " }}}

    augroup php_files " {{{
        au!
        " automatically remove trailing spaces on save, ignoring leading tabs
        autocmd BufWritePre *.php :%s/\([^\t]\+\)\@<=\s\+$
    augroup end " }}}

endif
" }}}

" Extra {{{
if has("gui_running")
	let g:solarized_menu=0
	let g:solarized_termcolors=256
	let g:solorized_bold=1
	let g:solarized_underline=1
	let g:solarized_italic=1
	set background="dark"
	colorscheme solarized
endif
"}}}
