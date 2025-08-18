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

require'nvim-treesitter.configs'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
