-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'git@github.com:wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup({
    config = {
        git = {
            default_url_format = 'git@github.com:%s.git',
        },
    },
function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
        use 'ellisonleao/gruvbox.nvim'

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('config.lualine')]],
        }

        use {
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('config.nvim-tree')]],
        }

        use {
            'akinsho/bufferline.nvim', tag = "v3.*",
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('config.bufferline')]],
        }

        use {
            'akinsho/toggleterm.nvim',
            tag = '*',
            config = [[require('config.toggleterm')]],
        }

        use {
            'nvim-treesitter/nvim-treesitter', tag = "v0.9.0",
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
            config = [[require('config.nvim-treesitter')]],
        }
        use 'HiPhish/nvim-ts-rainbow2'

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        -- nvim-cmp
        use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
        use { 'hrsh7th/cmp-nvim-lsp'}
        use { 'hrsh7th/cmp-buffer'}
        use { 'hrsh7th/cmp-path'}
        use { 'hrsh7th/cmp-cmdline'}

        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        use 'onsails/lspkind-nvim'
        use 'rafamadriz/friendly-snippets'

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            requires = { {'nvim-lua/plenary.nvim'} },
            config = [[require('config.telescope')]],
        }

        -- git
        use {
            'lewis6991/gitsigns.nvim', tag = 'v0.6',
            config = [[require('config.gitsigns')]],
        }
        use {
            'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = [[require('config.diffview')]],
        }

        use {'vim-scripts/Mark'}
        use {
            'windwp/nvim-autopairs',
            config = [[require('config.nvim-autopairs')]],
        }
        --use {'vim-scripts/DoxygenToolkit.vim'}
        use {
            "danymat/neogen", tag = "2.13.2",
            config = [[require('config.neogen')]],
            requires = "nvim-treesitter/nvim-treesitter",
        }
        use {
            'numToStr/Comment.nvim', tag = "v0.7.0",
            config = [[require('config.Comment')]],
        }
        use {
            'gcmt/wildfire.vim',
        }
        use({
            "kylechui/nvim-surround", tag = "v2.0.5",
            config = [[require('config.nvim-surround')]],
        })
        use({
            "glepnir/lspsaga.nvim",
            opt = true,
            branch = "main",
            event = "LspAttach",
            requires = {
                {"nvim-tree/nvim-web-devicons"},
                --Please make sure you install markdown and markdown_inline parser
                {"nvim-treesitter/nvim-treesitter"}
            },
            config = [[require('config.lspsaga')]],
        })
        use {
            'RRethy/vim-illuminate',
            config = [[require('config.vim-illuminate')]],
        }
        use {
            'abecodes/tabout.nvim',
            config = [[require('config.tabout')]],
            wants = {'nvim-treesitter'}, -- or require if not used so far
            after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
        }
        use {
            'andymass/vim-matchup',
            setup = function()
                -- may set any options here
                vim.g.matchup_matchparen_offscreen = { method = "popup" }
            end
        }
        use {
            'simrat39/symbols-outline.nvim',
            config = [[require('config.symbols-outline')]],
        }
        use({ 
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            ft = { "markdown" },
            config = [[require('config.markdown')]],
        })
        use ({
            "dhruvasagar/vim-table-mode",
            ft = { "markdown" },
        })
        use ({
            "img-paste-devs/img-paste.vim",
            ft = { "markdown" },
        })

        use ({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = [[require('config.todo-comments')]],
        })

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
})

