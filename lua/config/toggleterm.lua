local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.keymap.set

require("toggleterm").setup({
    open_mapping = [[<leader>t]],

    direction = 'float'
})

-- 快捷键
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "<A-l>", "<Cmd> wincmd l<CR>", opts)
map("t", "<A-h>", "<Cmd> wincmd h<CR>", opts)
map("t", "<A-j>", "<Cmd> wincmd j<CR>", opts)
map("t", "<A-k>", "<Cmd> wincmd k<CR>", opts)
--map("t", "q", "<cmd>close<CR>", opts)

-- 自定义终端
--local Terminal = require("toggleterm.terminal").Terminal
--
--local htopterm = Terminal:new({
--    cmd = "htop",
--    direction = "float",
--    on_open = function(term)
--        vim.cmd("startinsert!")
--        --vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--    end,
--    on_close = function(term)
--        vim.cmd("startinsert!")
--    end,
--})
--
--local lazygit_term = Terminal:new({
--    cmd = 'lazygit',
--    dir = "git_dir",
--    direction = 'float',
--    on_open = function(term)
--        vim.cmd("startinsert!")
--        --vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--    end,
--    on_close = function(term)
--        vim.cmd("startinsert!")
--    end,
--})
--
--function htop_toggle()
--    htopterm:toggle()
--end
--
--function lazygit_toggle()
--    lazygit_term:toggle()
--end

--map("n", "<leader>ht", "<Cmd>lua htop_toggle()<CR>", opts)
--map("n", "<leader>lg", "<Cmd>lua lazygit_toggle()<CR>", opts)

