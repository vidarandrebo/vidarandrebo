require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "go"
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
