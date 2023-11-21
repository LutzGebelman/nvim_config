local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

plugins = {
	{
		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} },
	},
    {
        'williamboman/nvim-lsp-installer',
        config = function()
            require("nvim-lsp-installer").setup({
                automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            })
        end
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
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-treesitter/nvim-treesitter',
    'theHamsta/nvim-dap-virtual-text',
    {
        "folke/which-key.nvim",
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
 --    -- Debugging
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-jdtls',
    {'ms-jpq/coq_nvim', branch='coq'},
    {'ms-jpq/coq.artifacts', branch='artifacts'},
    {'ms-jpq/coq.thirdparty', branch='3p'},
    {'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end},
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter', lazy = true },
        },
        event = 'VeryLazy',
        config = function()
            -- Load treesitter grammar for org
            require('orgmode').setup_ts_grammar()

            -- Setup treesitter
            require('nvim-treesitter.configs').setup({
                indent = {
                    enable = false
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { 'org' },
                },
                ensure_installed = { 'org' },
            })

            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },
    {
        'lukas-reineke/headlines.nvim',
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function() require('headlines').setup() end
    },
    {
        'michaelb/sniprun',
        build = 'sh install.sh'
    },
    {
        'akinsho/org-bullets.nvim',
        config = function() require('org-bullets').setup() end

    },
    'dhruvasagar/vim-table-mode',
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require('todo-comments').setup() end
    },
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    'dense-analysis/ale',
    'CFC-Servers/gluafixer.vim'
}


require('lazy').setup(plugins, opts)
