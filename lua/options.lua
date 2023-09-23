-- Hint: use `:h <option>` to figure out the meaning if needed
local options = {
    -- 用于指定打开文件的编码方式
    -- 用于指定Vim内部字符处理的编码方式
    fileencoding = 'utf-8', 
    encoding = "utf-8",
    termencoding = "utf-8",

    -- 开启语法高亮
    syntax = "enable",

    -- 显示行号
    -- 显示相对行号
    number = true, 
    relativenumber = true, 

    -- 设置制表符的宽度，默认情况下，一个制表符等于8个空格
    -- 定义软制表符的宽度。软制表符是指在编辑器中按下Tab键时插入的空格。softtabstop决定了在插入Tab时使用的空格数量。默认情况下，softtabstop的值和tabstop保持一致
    -- 设置缩进的宽度，当使用自动缩进或按下Tab键时，文本会缩进到shiftwidth定义的宽度。默认情况下，shiftwidth的值也是8， >> << 时移动长度
    -- 控制自动缩进是否按照shiftwidth的倍数进行对齐。如果shiftround设置为on，自动缩进将按shiftwidth的倍数进行对齐，否则将使用实际缩进的空格数。
    -- tabstop = 4,
    -- softtabstop = 4,
    -- shiftwidth = 4, 
    -- shiftround = true,

    -- 空格替代tab
    -- expandtab = true,

    -- unnamed：这是默认值，表示将文本复制到系统剪贴板（如果支持）以及Vim的寄存器中。
    -- unnamedplus：这个选项会将文本同时复制到系统剪贴板以及Vim的寄存器中。这样，你可以在Vim和其他应用程序之间共享剪贴板内容。
    -- autoselect：这个选项会将文本复制到系统剪贴板中，但不会存储在Vim的寄存器中。
    --clipboard = 'unnamedplus',

    -- 高亮当前行
    -- 不高亮当前列
    -- 右侧参考线
    cursorline = true, 
    cursorcolumn = true, 
    colorcolumn = "80",

    -- 显示光标位置
    ruler = true,

    --查找时忽略大小写
    --智能大小写
    ignorecase = true, 
    smartcase = true, 

    -- 搜索不要高亮
    -- 边输入边搜索
    hlsearch = true,
    incsearch = true,

    -- 显示左侧图标指示列
    signcolumn = "yes",

    -- 命令行高为2，提供足够的显示空间
    cmdheight = 1,

    -- 当文件被外部程序修改时，自动加载
    autoread = true,

    -- 禁止自动换行
    wrap = false,

    -- 允许隐藏被修改过的buffer
    hidden = true,

    --右下角显示模式
    showmode = true, 
    conceallevel = 0,

    --如果安装第三方主题，必须设置为true
    termguicolors = true, 

    -- 是否显示不可见字符
    -- 不可见字符的显示，这里只把空格显示为一个点
    list = true,
    --listchars = "space:·,tab:··",

    --允许鼠标
    mouse = 'a', 

    -- jkhl 移动时光标周围保留8行
    scrolloff = 8,
    sidescrolloff = 8,

    -- 0：不显示标签栏。这意味着在Vim窗口的底部不会显示任何文件标签。
    -- 1：只有在打开了多个文件时才显示标签栏。当只有一个文件打开时，标签栏会被隐藏。
    -- 2：无论是否只有一个文件打开，都显示标签栏。
    showtabline = 2,

    -- 禁止创建备份文件
    backup = false,
    writebackup = false,
    swapfile = false,

    --右下角显示命令
    showcmd = true, 
}
--这里只列举基础的配置，更多选项可以在Vim中:set all查询

--应用上面配置
vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- 新行对齐当前行，tab转换为空格
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true

-- tab键转换为4个空格
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.shiftround = true

vim.cmd([[
    set clipboard+=unnamed,unnamedplus
    " set clipboard+=unnamedplus
]])

-- autocmd BufNewFile, BufReadPost *.html setlocal nowrap

