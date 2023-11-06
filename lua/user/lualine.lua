local M = {
  "nvim-lualine/lualine.nvim",
  commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  -- local diagnostics = {
  --   "diagnostics",
  --   sources = { "nvim_lsp" },
  --   sections = { "error", "warn" },
  --   symbols = { error = " ", warn = " " },
  --   colored = false,
  --   always_visible = true,
  -- }

  local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
  }

  local filetype = {
    "filetype",
    icons_enabled = false,
  }

  local location = {
    "location",
    padding = 0,
  }

  local filename = {
    'filename',
    file_status = true,     -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    path = 1,
    -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory
    -- 4: Filename and parent dir, with tilde as the home directory

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
      modified = '[+]',      -- Text to show when the file is modified.
      readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[No Name]', -- Text to show for unnamed buffers.
      newfile = '[New]',     -- Text to show for newly created file before first write
    }

  }

  local searchcount = {
    'searchcount',
    maxcount = 999,
    timeout = 500,
  }

  local function is_go_file()
    local win_id = vim.api.nvim_get_current_win()
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")
    return ft == "go"
  end


  local function show_hover_info()
    if not is_go_file() then
      return ""
    end

    local params = vim.lsp.util.make_position_params()
    local results_lsp, err = vim.lsp.buf_request_sync(0, "textDocument/hover", params, 1000)
    if not results_lsp or vim.tbl_isempty(results_lsp) then
      return
    end

    local function remove_prefix_and_suffix(str)
      local without_prefix = string.gsub(str, "^```go\n", "")
      local without_prefix_and_suffix = string.gsub(without_prefix, "\n.*$", "")
      return without_prefix_and_suffix
    end

    local hover_info = ""
    for _, lsp_data in pairs(results_lsp) do
      local result = lsp_data.result
      if result and result.contents then
        if type(result.contents) == "table" then
          if result.contents.value then
            hover_info = result.contents.value
          else
            hover_info = table.concat(result.contents, "\n")
          end
        else
          hover_info = result.contents
        end
      end
    end

    if hover_info ~= "" then
      return remove_prefix_and_suffix(hover_info)
    end
    return ""
  end


  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "branch", filename },
      lualine_b = {
        {
          show_hover_info,
          color = 'Function',
          condition = is_go_file,
        }
      },
      lualine_c = { searchcount },
      lualine_x = { filetype },
      lualine_y = { location },
      lualine_z = { "progress" },
    },
  }
end

return M
