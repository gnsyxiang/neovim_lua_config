local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.api.nvim_set_keymap

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

-- load session
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- 定义<session-file> 所在目录
local sessionDir = vim.fn.stdpath("data") .. "/sessions/"

-- 删除选中session
local function delete_selection(prompt_bufnr, map)
 -- 关闭Prompt buffer
 actions.close(prompt_bufnr)
 -- 获取结果列表
 local selection = action_state.get_selected_entry()
 -- rm <session-file> 删除选中的session file
 vim.cmd([[!rm ]] .. sessionDir .. selection[1])
end

-- 进入选中session
local function load_session(prompt_bufnr)
 actions.close(prompt_bufnr)
 local selection = action_state.get_selected_entry()
 -- source session  :source <session-file>
 vim.cmd([[
    bufdo bwipe
    source ]] .. sessionDir .. selection[1])
end

local _manage_session = function()
 local opts = {
  -- 绑定Actions到Mappings
  -- attach_mappings绑定的键位映射只生效于telescope的buffer，不影响全局
  attach_mappings = function(_, map)
   -- <enter>键 进入选中session
   map("n", "<cr>", load_session)
   -- d键 删除选中session
   map("n", "d", delete_selection)
   return true
  end,
  -- 定义Finder的查找命令为ls <session-file所在的目录>
  find_command = {
   "ls",
   vim.fn.stdpath("data") .. "/sessions/",
  },
  prompt_title = "Manage session",
 }
 require("telescope.builtin").find_files(opts)
end

-- 全局键位映射，映射<space>s键为打开telescope会话管理
vim.keymap.set("n", "<space>s", _manage_session)
-- 将telescope会话管理包装为用户定义命令
vim.api.nvim_create_user_command("LoadSession", _manage_session, { desc = "load user session,like workspace" })

