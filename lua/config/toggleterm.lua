-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.api.nvim_set_keymap

map("n", "<A-=>",       ":term bash<CR>i",              opts)
map("t", "<A-=>",       "<C-\\><C-n>:bdelete! %<CR>",   opts)

map("t", "<Esc>",       "<C-\\><C-n>",                  opts) 
map("t", "<leader>l",   "<Cmd> wincmd l<CR>",           opts) 
map("t", "<leader>h",   "<Cmd> wincmd h<CR>",           opts) 
map("t", "<leader>j",   "<Cmd> wincmd j<CR>",           opts) 
map("t", "<leader>k",   "<Cmd> wincmd k<CR>",           opts)

local opt = require("toggleterm")

opt.setup({
    open_mapping = [[<A-\>]],

    -- 打开新终端后自动进入插入模式
    start_in_insert = true,

    -- 在当前buffer的下方打开新终端, horizontal, vertical、float、tab
    direction = 'float',
})

--local Terminal  = require('toggleterm.terminal').Terminal
--local htopterm = Terminal:new({
--    cmd = 'htop',
--    direction = 'float'
--})
--
--function htop_toggle()
--	htopterm:toggle()
--end
--
--map("n", "<leader>ht", "<Cmd> htop<CR>",    opts)
