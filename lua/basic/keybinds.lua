-- leader 键设置为空格
vim.g.mapleader = " "

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- 插入模下 jk 退出插入模式
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)

-- 是否显示绝对行号
vim.o.number = true
-- 是否显示相对行号
vim.o.relativenumber = true


-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true
