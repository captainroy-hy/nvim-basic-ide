-- 和 osc52 不兼容，暂时先不用
-- https://github.com/gbprod/yanky.nvim/issues/113
return {
  -- better yank/paste
  {
    "gbprod/yanky.nvim",
    -- event = "BufEnter",
    config = function()
      vim.keymap.set({ "n", "x" }, "p" , "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set({ "n", "x" }, "<leader>y", ":Telescope yank_history<CR>")
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
          ignore_registers = { "_" },
          update_register_on_cycle = false,
        },
        system_clipboard = {
          sync_with_ring = true,
        },
        telescope = {
          mappings = nil, -- nil to use default mappings
        },
      })
    end
    -- dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
    -- opts = {
    --   highlight = { timer = 250 },
    --   ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
    -- },
    -- keys = {
    --   -- stylua: ignore
    --   { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end,
    --                                                                                                   desc =
    --     "Open Yank History" },
    --   { "y",         "<Plug>(YankyYank)",                                                           mode = { "n", "x" },
    --                                                                                                                                                  desc =
    --     "Yank text" },
    --   { "p",         "<Plug>(YankyPutAfter)",                                                       mode = { "n", "x" },
    --                                                                                                                                                  desc =
    --     "Put yanked text after cursor" },
    --   { "P",         "<Plug>(YankyPutBefore)",                                                      mode = { "n", "x" },
    --                                                                                                                                                  desc =
    --     "Put yanked text before cursor" },
    --   { "gp",        "<Plug>(YankyGPutAfter)",                                                      mode = { "n", "x" },
    --                                                                                                                                                  desc =
    --     "Put yanked text after selection" },
    --   { "gP",        "<Plug>(YankyGPutBefore)",                                                     mode = { "n", "x" },
    --                                                                                                                                                  desc =
    --     "Put yanked text before selection" },
    --   { "[y",        "<Plug>(YankyCycleForward)",                                                   desc =
    --   "Cycle forward through yank history" },
    --   { "]y",        "<Plug>(YankyCycleBackward)",                                                  desc =
    --   "Cycle backward through yank history" },
    --   { "]p",        "<Plug>(YankyPutIndentAfterLinewise)",                                         desc =
    --   "Put indented after cursor (linewise)" },
    --   { "[p",        "<Plug>(YankyPutIndentBeforeLinewise)",                                        desc =
    --   "Put indented before cursor (linewise)" },
    --   { "]P",        "<Plug>(YankyPutIndentAfterLinewise)",                                         desc =
    --   "Put indented after cursor (linewise)" },
    --   { "[P",        "<Plug>(YankyPutIndentBeforeLinewise)",                                        desc =
    --   "Put indented before cursor (linewise)" },
    --   { ">p",        "<Plug>(YankyPutIndentAfterShiftRight)",                                       desc =
    --   "Put and indent right" },
    --   { "<p",        "<Plug>(YankyPutIndentAfterShiftLeft)",                                        desc =
    --   "Put and indent left" },
    --   { ">P",        "<Plug>(YankyPutIndentBeforeShiftRight)",                                      desc =
    --   "Put before and indent right" },
    --   { "<P",        "<Plug>(YankyPutIndentBeforeShiftLeft)",                                       desc =
    --   "Put before and indent left" },
    --   { "=p",        "<Plug>(YankyPutAfterFilter)",                                                 desc =
    --   "Put after applying a filter" },
    --   { "=P",        "<Plug>(YankyPutBeforeFilter)",                                                desc =
    --   "Put before applying a filter" },
    -- },
  },
}
