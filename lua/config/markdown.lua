-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.keymap.set

map("n", "<C-p>", ":MarkdownPreviewToggle<CR>", opts)
-- table-mode
map('n', '<C-t>', ':TableModeToggle<CR>', opts)
map('n', '<C-r>', ':TableModeRealign<CR>', opts)

vim.cmd([[
    autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
    " there are some defaults for image directory and image name, you can change them
    let g:mdip_imgdir = 'img'
    let g:mdip_imgname = 'image'
]])

vim.cmd([[
    let g:mkdp_auto_start = 0
    let g:mkdp_refresh_slow = 1
    let g:mkdp_markdown_css = expand('~/.config/nvim/static/markdown.css')
    let g:mkdp_highlight_css = expand('~/.config/nvim/static/highlight.css')
    let g:mkdp_theme = 'dark'
]])

vim.cmd([[
let g:table_mode_corner = '|'
let g:table_mode_border=0
let g:table_mode_fillchar=' '

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

]])
