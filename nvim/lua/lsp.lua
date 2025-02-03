local lsp_zero = require('lsp-zero')

local util = require ("lspconfig/util")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
    ensure_installed = {
        'terraformls',
        'eslint',
        'rust_analyzer',
        'gopls',
        'clangd',
        'omnisharp',
        'volar',
        'lua_ls',
        'pyright',
    },
--  handlers = {
--    lsp_zero.default_setup,
--  }
    handlers = nil,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    filetypes = {"rust"},
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
}
lspconfig.eslint.setup {
    capabilities = capabilities
}
lspconfig.terraformls.setup {
    capabilities = capabilities
}
lspconfig.pyright.setup {}
lspconfig.omnisharp.setup {
    capabilities = capabilities,
    enable_roslyn_analysers = true,
	enable_import_completion = true,
	organize_imports_on_format = true,
	enable_decompilation_support = true,
	filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'props', 'targets' }
}
lspconfig.gopls.setup {
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
        completeUnimported = true,
        --usePlaceholders = true,
        analyses = {
            unusedparams = true,
      },
    },
  },
}
lspconfig.lua_ls.setup {
    capabilities = capabilities,
}
lspconfig.clangd.setup {
    capabilities = capabilities,
}
lspconfig.texlab.setup {
    capabilities = capabilities,
}

lspconfig.volar.setup {
  -- add filetypes for typescript, javascript and vue
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<Tab>'] = cmp_action.luasnip_next(),

    -- Navigate between snippet placeholder
    -- 'volar',
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'},
    --{name = 'nvim_lsp_signature_help'},
  },
})

local lsp_sign_cfg = require("lsp_signature_cfg")
require'lsp_signature'.setup(lsp_sign_cfg)

