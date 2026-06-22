local function on_attach(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr }

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)

    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "rounded",
        },
    }, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
