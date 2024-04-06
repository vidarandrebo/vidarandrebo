require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
	},
    {
        'navarasu/onedark.nvim',
    },
    {
        'preservim/nerdtree'
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },



    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
})
