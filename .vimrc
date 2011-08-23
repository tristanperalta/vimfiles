" this script is based on http://mirnazim.org/writings/vim-plugins-i-use/

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader = "-"

" fuzzy finder => https://github.com/vim-scripts/FuzzyFinder
noremap <Leader>o <Esc>:FufCoverageFile<CR>

" tagbar => https://github.com/majutsushi/tagbar
let g:tagbar_usearrow = 1
noremap <Leader>g :TagbarToggle<CR>

" nerdtree => https://github.com/scrooloose/nerdtree
noremap <Leader>t :NERDTreeToggle<CR>

" minibufexpl => https://github.com/fholgado/minibufexpl.vim
noremap <C-h> :bp<CR>
noremap <C-l> :bn<CR>
noremap <C-d> :bd<CR>

" solarized => https://github.com/altercation/vim-colors-solarized
let g:solarized_menu=0
set background="dark"
colorscheme solarized

" Ctrl-s like windows
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

" automatically remove trailing spaces on save, ignoring leading tabs
autocmd BufWritePre *.py,*.php,*.rb :%s/\([^\t]\+\)\@<=\s\+$

" html_autoclosetag
" au FileType xhtml,xml,ctp so $VIMRUNTIME/ftplugin/html_autoclosetag.vim

syntax on
filetype plugin indent on
set mouse=a
set number
set showcmd
set tabstop=2
set autoindent

augroup rubyfiletypes
				" Clear old autocmds in group
				autocmd!
				" autoindent with two spaces, always expand tabs
				autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
