local _config = {
    cmd = {'~/download/jdt/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

local M = {
  "mfussenegger/nvim-jdtls",
  config = function ()
    require('jdtls').start_or_attach(_config)
  end
}

return M
