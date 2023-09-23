-- Note: The order matters: mason -> mason-lspconfig -> lspconfig
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local install_servers = {
    'lua_ls',
    'bashls',
    'clangd',
    'jsonls',
    'vimls',
}

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = install_servers,
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer
local lspconfig = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- 跳转到声明
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", bufopts)

    -- 跳转到定义
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

    -- 跳转到引用位置
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gr', "<cmd>Lspsaga rename<CR>", bufopts)

    -- 显示注释文档
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    vim.keymap.set('n', 'gh', "<cmd>Lspsaga finder<CR>", bufopts)

    -- 跳转到实现
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    -- 以浮窗形式显示错误
    vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", bufopts)
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", bufopts)
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)
    vim.keymap.set('n', '<leader>q', "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts)

    --vim.keymap.set('n', '<leader>cd', "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
    --vim.keymap.set('n', '<leader>cd', "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
    vim.keymap.set('n', '<leader>cf', "<cmd>Lspsaga show_buf_diagnostics<CR>", bufopts)
    vim.keymap.set('n', '<leader>cd', "<cmd>Lspsaga show_workspace_diagnostics<CR>", bufopts)
    vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", bufopts)
    vim.keymap.set('v', '<leader>ca', "<cmd>Lspsaga code_action<CR>", bufopts)

    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    --vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

end

for _, lsp in ipairs(install_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Hint: The `settings` table is sent in `on_init` via a `workspace/didChangeConfiguration` notification
-- from the Nvim client to the language server.
-- `pyright.disableLanguageServices`: `boolean`
-- require('lspconfig').pyright.setup {
--     settings = {
--         pyright = {
--             disableLanguageServices = true,
--         }
--     }
-- }

-- Configure each language
-- lspconfig.pylsp.setup({
--     on_attach = on_attach,
-- })
-- 
-- lspconfig.gopls.setup({
--     on_attach = on_attach,
-- })
-- 
-- 
-- lspconfig.bashls.setup({})
-- 
-- -- source: https://rust-analyzer.github.io/manual.html#nvim-lsp
-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     settings = {
--         ['rust-analyzer'] = {
--             inlayHints = {
--                 closingBraceHints = true, -- Whether to show inlay hints after a closing } to indicate what item it belongs to.
--             }
--         }
--     }
-- })

-- lspconfig.lua_ls.setup {
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }

