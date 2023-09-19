plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} },
	},
    'neovim/nvim-lspconfig',
    'tanvirtin/monokai.nvim',
    'preservim/nerdtree',
    'ryanoasis/vim-devicons',
    'PhilRunninger/nerdtree-visual-selection',
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    'hrsh7th/vim-vsnip',
    {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    },
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-treesitter/nvim-treesitter',
    'theHamsta/nvim-dap-virtual-text',
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- Debugging
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-jdtls',
    {'ms-jpq/coq_nvim', branch='coq'},
    {'ms-jpq/coq.artifacts', branch='artifacts'},
    {'ms-jpq/coq.thirdparty', branch='3p'},
    {'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end},
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_start = 1
        end,
        ft = { "markdown" },
    },
}


require('lazy').setup(plugins, opts)
