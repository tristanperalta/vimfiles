vimfiles
========

Set of plugins and vim configuration. Uses [vundle](https://github.com/gmarik/vundle) to organize plugins.

Features
---------
 * Tree view
 * Tag view
 * [Binds <C-s> for saving](http://sigttou.com/vim-ctrl-s) (like windows).
 * Search text pattern on each source file from (current working) directory recursively

Installation
------------
 1. In your home directory, type

        $ git clone git@bitbucket.org:tristan_ph/vimfiles.git

 2. Create symlinks

        $ ln -s ~/vimfiles/.vimrc .vimrc
        $ ln -s ~/vimfiles/ .vim

 3. Initialize submodule and bundles

        $ git submodule update --init
        $ vim -c ':BundleInstall'

 4. For the Ctrl-s to work properly, add this to your .bashrc file

        stty stop ''

 5. Install required fonts

        $ sudo apt-get install ttf-inconsolata


Basic Usage
-----------
 * to open fuzzy matching, <Leader>o
 * to open tree view, hit <Leader>t
 * to comment multiple lines, select lines
   (using visual or select from mouse), <Leader>cc
 * Hold <C-h> or <C-l> to move between buffers
 * Hold <C-d> to delete current buffer (close file).

Bundled Plugins
---------------
 * [ack.vim](https://github.com/mileszs/ack.vim) - type <leader> - A to initiate search
 * [delimitmate](https://github.com/Raimondi/delimitMate.git) - autocompletion of quotes, parenthesis, brackets etc.
 * [CtrlP](https://github.com/kien/ctrlp.vim) - implements TextMate cmd-T functionality
 * [html5.vim](https://github.com/othree/html5.vim.git) - syntax for HTML 5
 * [minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim.git) - buffer explorer
 * [nerdcommenter](https://github.com/scrooloose/nerdcommenter.git) - for easy commenting
 * [nerdtree](https://github.com/scrooloose/nerdtree.git) - file tree explorer
 * [snipmate.vim](https://github.com/msanders/snipmate.vim.git) - implements TextMate snippets feature
 * [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git)
 * [vim-easymotion](https://github.com/Lokaltog/vim-easymotion.git) - Simple way to use motions
 * [vim-jquery](https://github.com/itspriddle/vim-jquery.git) - jQuery syntax
 * [vim-fugitive](https://github.com/tpope/vim-fugitive.git) - Git support
 * [vim-rails](https://github.com/tpope/vim-rails.git) - Ruby on Rails tools
 * [vim-surround](https://github.com/tpope/vim-surround.git) - surrounding parenthesis, brackets, quotes, XML and more
