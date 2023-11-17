-- for Golang file it's better than symbols-outline.lua
-- but it only works for Golang

local M = {
  "crusj/structrue-go.nvim",
  branch = "main",
}

function M.config()
  require("structrue-go").setup {
    show_others_method = true, -- bool show methods of struct whose not in current file
    show_filename = false,     -- bool
    number = "no",             -- show number: no | nu | rnu
    fold_open_icon = " ",
    fold_close_icon = " ",
    cursor_symbol_hl = "guibg=Gray guifg=White", -- symbol hl under cursor,
    indent = "├", -- Hierarchical indent icon, nil or empty will be a tab
    position = "botright", -- window position,default botright,also can set float
    symbol = { -- symbol style
      filename = {
        hl = "guifg=#0096C7", -- highlight symbol
        icon = " ", -- symbol icon
      },
      package = {
        hl = "guifg=#ebc275",
        icon = " ",
      },
      import = {
        hl = "guifg=#0096C7",
        icon = " ◈ ",
      },
      const = {
        hl = "guifg=#fe7348",
        icon = "  ",
      },
      variable = {
        hl = "guifg=#dca16a",
        icon = "  ",
      },
      func = {
        hl = "guifg=#5ab0f6",
        icon = "  ",
      },
      interface = {
        hl = "guifg=#00B4D8",
        icon = " ﰮ ",
      },
      type = {
        hl = "guifg=#00B4D8",
        icon = " 𝓒 ",
      },
      struct = {
        hl = "guifg=#ebc275",
        icon = " 𝓢 ",
      },
      field = {
        hl = "guifg=#4dbdcb",
        icon = "  ",
      },
      method_current = {
        hl = "guifg=#5ab0f6",
        icon = " ƒ ",
      },
      method_others = {
        hl = "guifg=#5ab0f6",
        icon = "  ",
      },
    },
    keymap = {
      toggle = "<Space>m",             -- toggle structure-go window
      show_others_method_toggle = "H", -- show or hidden the methods of struct whose not in current file
      symbol_jump = "<CR>",            -- jump to then symbol file under cursor
      center_symbol = "\\f",           -- Center the highlighted symbol
      fold_toggle = "z",
      refresh = "R",                   -- refresh symbols
      preview_open = "P",              -- preview  symbol context open
      preview_close = "\\p",           -- preview  symbol context close
    },
    fold = {                           -- fold symbols
      import = true,
      const = false,
      variable = false,
      type = false,
      interface = false,
      func = false,
    },
  }
end

return M
