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

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        'lua_ls',
        'bashls',
        'clangd',
        'jsonls',
        'pylsp',
        'vimls',
    },
})
