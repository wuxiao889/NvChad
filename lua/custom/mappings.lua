---@type MappingsTable
local M = {}
local Util = require("util.init")

M.general = {
  i = {
    ["kj"] = { "<Esc>", "kj is Esc"},
  },

  n = {
    ["<S-h>"] = { ":bp<cr>", "prev buf"},
    ["<S-l>"] = { ":bn<cr>", "next buf"},
    ["<Leader>ev"] = {":e $MYVIMRC<cr>", "edit nvim config"},
    ["<Leader>sv"] = {":luafilej $MYVIMRC<cr>", "source nvim config"},
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<Space>e"] = {
      function()
        require("nvim-tree.api").tree.toggle({path = require("util").get_root()})
      end,
      "Toggle nvimtree (root dir)" },
    ["<Space>E"] = {
      function()
        require("nvim-tree.api").tree.toggle({path = vim.loop.cwd()})
      end,
      "Toggle nvimtree (cwd)" },
    ["<Space>f"] = { "<cmd>NvimTreeFocus<CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>,"] = {
      function()
        require("telescope.builtin").buffers({initial_mode = "normal", show_all_buffers = "true"})
      end,
      desc = "Switch Buffer"
    },
    ["<leader>/"] = { Util.telescope("live_grep"), desc = "Grep (root dir)"},
    ["<leader>:"] = { Util.telescope("command_history", { initial_mode = "normal"}), desc = "Command History"},
    -- find files
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", desc = "Buffers"},
    ["<leader>ff"] = { Util.telescope("files"), desc = "Find files (t dir)"},
    ["<leader>fF"] = { Util.telescope("files", { cwd = false}), desc = "Find files (cwd)"},
    ["<leader>fr"] = { Util.telescope("oldfiles", { initial_mode = "normal"}), desc = "Recent"},
    ["<leader>fR"] = { Util.telescope("oldfiles", { initial_mode = "normal", cwd = vim.loop.cwd()}), desc = "Recent (cwd)"},
    -- git
    ["<leader>gc"] = { Util.telescope("git_commits", { initial_mode = "normal"}), desc = "git commits"},
    ["<leader>gs"] = { Util.telescope("git_status", { initial_mode = "normal"}), desc = "git status"},
    -- search
    ["<leader>sb"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer"},
    ["<leader>sc"] = { "<cmd>Telescope commands<cr>", desc = "Commands"},
    ["<leader>sd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Dia"},
    ["<leader>sg"] = { Util.telescope("live_grep"), desc = "Grep (root dir)"},
    ["<leader>sG"] = { Util.telescope("live_grep", {cwd = false}), desc = "Grep (cwd)"},
    ["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", desc = "Key Maps"},
  }
}
-- more keybinds!

return M
