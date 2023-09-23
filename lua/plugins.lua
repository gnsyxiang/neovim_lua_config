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

        use 'ellisonleao/gruvbox.nvim'

        -- 启动页
        --use {
        --    'glepnir/dashboard-nvim',
        --    event = 'VimEnter',
        --    requires = { 'nvim-tree/nvim-web-devicons'},
        --    config = [[require('config.dashboard')]],
        --}

        -- 快捷键提示
        use {
            "folke/which-key.nvim",
            config = [[require('config.which-key')]],
        }

        -- 文件管理器
        use {
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons'},
            config = [[require('config.nvim-tree')]],
        }

        use {
            "akinsho/toggleterm.nvim", tag = '*',
            config = [[require('config.toggleterm')]],
        }

        -- 状态栏
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('config.lualine')]],
        }

        -- 标签页
        use {
            'akinsho/bufferline.nvim', tag = "*",
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('config.bufferline')]],
        }

        -- 代码高亮
        use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
            config = [[require('config.nvim-treesitter')]],
        }

        -- 模糊查询
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.3',
            requires = {
                {'nvim-lua/plenary.nvim'},
            },
            config = [[require('config.telescope')]],
        }

        -- use {
        --     'rmagatti/auto-session',
        --     config = [[require('config.auto-session')]],
        -- }

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        use ({
            'nvimdev/lspsaga.nvim',
            after = 'nvim-lspconfig',
            config = function()
                require('lspsaga').setup({})
            end,
        })


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
            'gcmt/wildfire.vim',
        }
        use {
            "kylechui/nvim-surround", tag = "v2.0.5",
            config = [[require('config.nvim-surround')]],
        }

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
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

        use {
            "danymat/neogen", tag = "*",
            config = [[require('config.neogen')]],
            requires = "nvim-treesitter/nvim-treesitter",
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
})
