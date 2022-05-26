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

-- 支持 LSP 状态的 buffer 栏
use {
    "akinsho/bufferline.nvim",
    requires = {
        "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
    },
    config = function()
        require("conf.bufferline")
    end
}

-- 搜索时显示条目
use {
    "kevinhwang91/nvim-hlslens",
    config = function()
        require("conf.nvim-hlslens")
    end
}

-- 显示缩进线
use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("conf.indent-blankline")
    end
}

-- 自动匹配括号
use {
    "windwp/nvim-autopairs",
    config = function()
        require("conf.nvim-autopairs")
    end
}

-- 快速更改单词
use {
    "AndrewRadev/switch.vim",
    config = function()
        require("conf.switch")
    end
}

-- 快速跳转
use {
    "phaazon/hop.nvim",
    config = function()
        require("conf.hop")
    end
}

-- 包裹修改
use {
    "ur4ltz/surround.nvim",
    config = function()
        require("conf.surround")
    end
}

-- 显示光标下相同词汇
use {
    "RRethy/vim-illuminate",
    config = function()
        require("conf.vim-illuminate")
    end
}

-- 拼写检查器
use {
    "lewis6991/spellsitter.nvim",
    config = function()
        require("conf.spellsitter")
    end
}

-- 自动保存
use {
    "Pocco81/AutoSave.nvim",
    config = function()
        require("conf.AutoSave")
    end
}

-- 自动恢复光标位置
use {
    "ethanholz/nvim-lastplace",
    config = function()
        require("conf.nvim-lastplace")
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
