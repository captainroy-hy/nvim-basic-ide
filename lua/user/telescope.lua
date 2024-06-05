local M = {
  "nvim-telescope/telescope.nvim",
  commit = "74ce793a60759e3db0d265174f137fb627430355",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
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
    -- vimgrep_arguments = {
    --   "ag",
    --   "--nocolor",
    --   "--noheading",
    --   "--numbers",
    --   "--column",
    --   "--smart-case",
    --   "--silent",
    --   "--vimgrep",
    -- }
  },
}

local live_grep_in_glob = function(glob_pattern)
  require('telescope.builtin').live_grep({
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob=" .. (glob_pattern or ""),
    }
  })
end

M.live_grep_in_glob = function()
  vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end


return M
