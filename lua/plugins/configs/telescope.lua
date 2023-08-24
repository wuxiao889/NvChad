local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "> ",
    selection_caret = "* ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.95,
      height = 0.90,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        -- ["<c-t>"] = function(...)
        --   return require("trouble.providers.telescope").open_with_trouble(...)
        -- end,
        -- ["<a-t>"] = function(...)
        --   return require("trouble.providers.telescope").open_selected_with_trouble(...)
        -- end,
        -- ["<a-i>"] = function()
        --   local action_state = require("telescope.actions.state")
        --   local line = action_state.get_current_line()
        --   Util.telescope("find_files", { no_ignore = true, default_text = line })()
        -- end,
        -- ["<a-h>"] = function()
        --   local action_state = require("telescope.actions.state")
        --   local line = action_state.get_current_line()
        --   Util.telescope("find_files", { hidden = true, default_text = line })()
        -- end,
        ["<C-Down>"] = function(...)
          return require("telescope.actions").cycle_history_next(...)
        end,
        ["<C-Up>"] = function(...)
          return require("telescope.actions").cycle_history_prev(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
        ["<C-b>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
      },
      n = {
        ["q"] = function(...)
          return require("telescope.actions").close(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").results_scrolling_down(...)
        end,
        ["<C-b>"] = function(...)
          return require("telescope.actions").results_scrolling_up(...)
        end,
      },
    },
  },

  extensions_list = { "themes", "terms" },
}

return options
