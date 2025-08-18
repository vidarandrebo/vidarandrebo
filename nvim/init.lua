vim.cmd([[ 
    nnoremap <silent> ^ :resize +2<CR>
    nnoremap <silent> ** :resize -2<CR>
    filetype plugin indent on
    syntax enable
    set clipboard+=unnamedplus
]])


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.softtabstop=4
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false
vim.opt.title = true
vim.opt.signcolumn = "number"
vim.opt.termguicolors = true     -- enable true colors support

vim.opt.spelllang = 'en_gb'
vim.opt.spell = true


require("config.lazy")
require("remap")
local lspconfig = require("lspconfig")

require("mason").setup()

lspconfig.lua_ls.setup{}

require("mason-lspconfig")
