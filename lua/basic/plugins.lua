---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- 包管理器
            use {"wbthomason/packer.nvim"}

	    -- 中文文档
            use {"yianwillis/vimcdoc"}

	    -- nvim-tree
	use {
	    "kyazdani42/nvim-tree.lua",
	    requires = {
	        -- 依赖一个图标插件
	        "kyazdani42/nvim-web-devicons"
	    },
	    config = function()
	        require("conf.nvim-tree")
	    end
	}

	use {
            "beauwilliams/focus.nvim",
	    config = function()
	        require("conf.focus")
	    end
	}

	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	    config = function()
	        require("conf.lualine")
	    end
}

	use {
		"morhetz/gruvbox",
	    config = function()
	        require("conf.gruvbox")
	    end
	}

	-- 为了能让状态栏显示 git 信息，所以这个插件是必须的
use {
    "lewis6991/gitsigns.nvim",
    requires = {
        -- 依赖于该插件（一款 Lua 开发使用的插件）
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("conf.gitsigns")
    end
}

            -- 安装其它插件
        end,

        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)
