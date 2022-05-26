-- https://github.com/beauwilliams/focus.nvim

require("focus").setup(
{
}
)

vim.api.nvim_set_keymap('n', '<leader>wh', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', ':FocusSplitRight<CR>', { silent = true })
