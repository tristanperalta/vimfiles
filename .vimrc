call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader = "-"

" css_color.vim => https://github.com/vim-scripts/css_color.vim
" better-css-syntax-for-vim => https://github.com/vim-scripts/Better-CSS-Syntax-for-Vim
" fuzzy finder => https://github.com/vim-scripts/FuzzyFinder
noremap <Leader>o <Esc>:FufCoverageFile<CR>

" tagbar => https://github.com/majutsushi/tagbar
let g:tagbar_usearrow = 1
noremap <Leader>t :TagbarToggle<CR>

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

set mouse=a
set number
set showcmd
set tabstop=2
set autoindent
