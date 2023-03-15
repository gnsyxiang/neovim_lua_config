local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.keymap.set

map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fo", "<Cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fm", "<Cmd>Telescope marks<CR>", opts)
map("n", "<leader>fj", "<Cmd>Telescope jumplist<CR>", opts)
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", opts)

require('telescope').setup {
    -- extensions = {
    --     fzf = {
    --         fuzzy = true,                   -- false will only do exact matching
    --         override_generic_sorter = true, -- override the generic sorter
    --         override_file_sorter = true,    -- override the file sorter
    --         case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    --     }
    -- }
}

