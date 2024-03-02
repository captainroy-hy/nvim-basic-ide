local M = {
  "nvim-telescope/telescope.nvim",
  commit = "74ce793a60759e3db0d265174f137fb627430355",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
    },
  },
}

local actions = require "telescope.actions"

M.opts = {
  defaults = {
    layout_config = { height = 0.99, width = 0.99, preview_width = 0.6 },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    vimgrep_arguments = {
      "ag",
      "--nocolor",
      "--noheading",
      "--numbers",
      "--column",
      "--smart-case",
      "--silent",
      "--vimgrep",
    }
  },
}

return M
