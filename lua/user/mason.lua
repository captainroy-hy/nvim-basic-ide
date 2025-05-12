local M = {
  "williamboman/mason.nvim",
  commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "25c11854aa25558ee6c03432edfa0df0217324be",
    },
  },
}

local settings = {
  ui = {
    border = "none",
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    },
  },
  log_level = vim.log.levels.DEBUG,
  max_concurrent_installers = 4,
  registries = {
    "github:mason-org/mason-registry",
    "lua:mason-registry.index"
  },
}

function M.config()
  require("mason").setup(settings)
  require("mason-lspconfig").setup {
    ensure_installed = require("utils").servers,
    automatic_installation = true,
  }
end

return M
