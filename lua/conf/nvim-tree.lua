-- https://github.com/kyazdani42/nvim-tree.lua

require("nvim-tree").setup(
    {
        -- 视图
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            auto_resize = true,
            side = "right"
        }
    }
)

-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1

-- 打开文件树
--vim.keybinds.gmap("n", "<F3>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>to", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)

-- 在文件树中找到当前以打开文件的位置
vim.keybinds.gmap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)

-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
