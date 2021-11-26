packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-surround')
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('mhinz/vim-mix-format')
call minpac#add('vim-airline/vim-airline')
call minpac#add('mileszs/ack.vim')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

let mapleader = "-"
nnoremap <leader>o :<C-u>FZF<CR>

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.* for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

nvim_lsp.elixirls.setup {
  on_attach = on_attach,
  cmd = { "/home/tristan/elixirls/language_server.sh" }
}
EOF

let g:mix_format_on_save = 1

nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :nohl<CR>

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

set number
set history=1000

" invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·,extends:#,nbsp:·
setlocal list

" deletes trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" buffers
noremap <C-Tab> :bnext<CR>
noremap <C-S-Tab> :bprev<CR>
noremap <C-n> :bnext<CR>
noremap <C-p> :bprev<CR>
noremap <leader>d <Esc>:bdel<CR>

map <C-s> :w<CR>

" ack.vim --- {{{
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

nnoremap <leader>a :Ack<Space>
" }}}

nnoremap <silent> <C-[> :cprevious<CR>
nnoremap <silent> <C-]> :cnext<CR>

