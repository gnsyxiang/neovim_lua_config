require("symbols-outline").setup()

vim.api.nvim_set_keymap("n", "<A-m>", ":SymbolsOutline<cr>" , {silent = true, noremap = true})
