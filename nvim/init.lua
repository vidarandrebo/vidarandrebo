-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "ray-x/lsp_signature.nvim" },
})

require("treesitter")
require("setup_mason")
require("setup_completion")
require("setup_lspconfig")
require("setup_signature")

-- Keymaps
local map = vim.keymap.set

-- Insert mode: bracket shortcuts for Norwegian keyboard
map("i", "øø", "{")
map("i", "ææ", "}")
map("i", "ØØ", "[")
map("i", "ÆÆ", "]")
map("i", "åå", "{}")
map("i", "ÅÅ", "()")

-- Normal mode: window navigation
map("n", "JJ", "<C-W>j")
map("n", "KK", "<C-W>k")
map("n", "HH", "<C-W>h")
map("n", "LL", "<C-W>l")
map("n", "==", "<C-W>=")

-- Normal mode: window resizing
map("n", "^", ":resize +2<CR>", { silent = true })
map("n", "**", ":resize -2<CR>", { silent = true })
map("n", "<<", "5<C-w><")
map("n", ">>", "5<C-w>>")
