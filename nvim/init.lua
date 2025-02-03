vim.cmd([[ nnoremap <silent> ^ :resize +2<CR>
nnoremap <silent> ** :resize -2<CR>

filetype plugin indent on
syntax enable


map <silent> <C-n> :NERDTreeFocus<CR>

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



-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require ("packages")

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "go", "lua", "vim", "vimdoc", "query", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

--require('onedark').setup {
--    style = 'darker'
--}
--require('onedark').load()
--colorscheme = vim

require("catppuccin").setup({
  flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
  })

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

require ("remap")
require("lsp")

