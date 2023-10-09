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
    commit="dac8c39812dae025255c9069a260e1f69d967927",
    lazy=false,
    priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
    require('onedark').setup {
      style = 'cool'
    }
    require('onedark').load()
end

return M

