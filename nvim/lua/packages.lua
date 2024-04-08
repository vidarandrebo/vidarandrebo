require("lazy").setup({
	{
        --syntax-highlighting
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
	},
    {
        --theme
        'navarasu/onedark.nvim',
    },
    {
        --filetree
        'preservim/nerdtree'
    },
    {
        --fuzzy finder
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
    {
        --pkg manager for language-servers
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
    },
    {
        'saadparwaiz1/cmp_luasnip'
    },
    {
        --function signature box
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
    },
})
