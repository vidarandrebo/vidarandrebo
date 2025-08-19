return {{
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls", 
            "gopls",
            "rust_analyzer",
            --"java_language_server",
            "omnisharp"
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    automatic_enable = true,
}}
