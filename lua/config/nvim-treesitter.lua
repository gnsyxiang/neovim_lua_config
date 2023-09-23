for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub("https://github.com/", "git@github.com:")
end

local config = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "lua", "vim",
        "luadoc", "vimdoc",
        "c", "cpp",
        "html", "css", "javascript", "typescript",
        "json", "python", "regex", "bash",
        "ninja", "meson", "make", "cmake",
        "dot", "devicetree", "comment", "markdown",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    --启用增量选择
    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },

    -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
    indent = {
        enable = true
    },
}

require('nvim-treesitter.configs').setup(config)

-- 开启 Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

-- local auto_indent = vim.api.nvim_create_augroup("AUTO_INDENT", {clear = true})
-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--     pattern = "*",
--     group = auto_indent,
--     command = 'normal! gg=G``'
-- })

