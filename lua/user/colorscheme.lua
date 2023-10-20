-- local M = {
--   "folke/tokyonight.nvim",
--   commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- M.name = "tokyonight-night"
-- function M.config()
--   local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
--   if not status_ok then
--     return
--   end
-- end
--
-- return M

-- local M = {
--     "Mofiqul/dracula.nvim",
--     commit="9fe831e685a76e1a1898a694623b33247c4d036c",
--     lazy=false,
--     priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- M.name = "dracula"
--
-- function M.config()
--     require("dracula").setup()
--     vim.cmd[[colorscheme dracula]]
-- end
--
-- return M

local M = {
  "navarasu/onedark.nvim",
  commit = "dac8c39812dae025255c9069a260e1f69d967927",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.g.go_highlight_types = 1
  vim.g.go_highlight_fields = 1
  vim.g.go_highlight_functions = 1
  vim.g.go_highlight_function_calls = 1
  vim.g.go_highlight_operators = 1
  vim.g.go_highlight_function_parameters = 1
  vim.g.go_highlight_extra_types = 1
  vim.g.go_highlight_variable_declarations = 1
  vim.g.go_highlight_variable_assignments = 1

  require("onedark").setup {
    style = "cool",
    transparent = true,           -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts",                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = "italic",
      keywords = "none",
      functions = "none",
      strings = "none",
      variables = "none",
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
      ["LspReferenceText"] = { bg = '#59abee', fg ='#FFFFFF' },
      ["TreesitterContext"] = { bg = '#434c65' },
      -- CursorLine = { cterm="underline", guibg="#7d3343" }
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true,     -- darker colors for diagnostic
      undercurl = true,  -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  }
  require("onedark").load()
end

return M
