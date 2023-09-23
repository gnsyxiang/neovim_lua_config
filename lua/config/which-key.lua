
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.register({
    --["<leader>f"] = {
    --    f = { ":edit $MYVIMRC<CR>", "Open vimrc" },
    --    s = { ":source $MYVIMRC<CR>", "reload vimrc", noremap = true },
    --    n = { "New File" },
    --},
})
