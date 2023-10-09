local M = {
  "leoluz/nvim-dap-go",
  commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766",
  event = "VeryLazy",
}

function M.config()
  require('dap-go').setup()
end

return M
