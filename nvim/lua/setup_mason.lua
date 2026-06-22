require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "clangd",
        "rust_analyzer",
        "bashls",
        "pyright",
    },
    automatic_installation = true,
})
