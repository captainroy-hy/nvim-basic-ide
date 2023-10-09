local M = {
  "HiPhish/rainbow-delimiters.nvim",
  commit = "652345bd1aa333f60c9cbb1259f77155786e5514",
  event = "BufReadPre",
}

function M.config()
  local rainbow_delimiters = require "rainbow-delimiters"

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
      vim = rainbow_delimiters.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  }
end

return M
