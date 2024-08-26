vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     local line_count = vim.api.nvim_buf_line_count(0)
--     if line_count >= 5000 then
--       vim.cmd "IlluminatePauseBuf"
--     end
--   end,
-- })

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*.*',
  callback = function()
    vim.cmd 'doautocmd User format'
    vim.cmd 'update'
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*.cue',
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    vim.api.nvim_command('update')
    local output = vim.fn.system('cue fmt ' .. bufname)
    -- 打印输出
    if output ~= '' then
      print(output)
    end
    vim.api.nvim_command('checktime')
    if vim.api.nvim_buf_get_option(0, 'modified') then
      print('File was changed by an external command!')
    end
  end,
})

vim.api.nvim_create_autocmd({ 'TextChanged' }, {
  pattern = '*.*',
  callback = function()
    vim.cmd 'update'
  end,
})

-- local function show_hover_info()
--   local params = vim.lsp.util.make_position_params()
--   local results_lsp, err = vim.lsp.buf_request_sync(0, "textDocument/hover", params, 1000)
--   if not results_lsp or vim.tbl_isempty(results_lsp) then
--     return
--   end
--
--   local function remove_prefix_and_suffix(str)
--     local without_prefix = string.gsub(str, "^```go\n", "")
--     local without_prefix_and_suffix = string.gsub(without_prefix, "\n```.*$", "")
--     return without_prefix_and_suffix
--   end
--
--   local hover_info = ""
--   for _, lsp_data in pairs(results_lsp) do
--     local result = lsp_data.result
--     vim.print(result)
--     if result and result.contents then
--       if type(result.contents) == "table" then
--         if result.contents.value then
--           hover_info = result.contents.value
--         else
--           hover_info = table.concat(result.contents, "\n")
--         end
--       else
--         hover_info = result.contents
--       end
--     end
--   end
--
--   if hover_info ~= "" then
--     -- vim.print(remove_prefix_and_suffix(hover_info))
--     print(remove_prefix_and_suffix(hover_info))
--   end
-- end
--
-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
--   pattern = '*.go',
--   callback = function()
--     show_hover_info()
--   end,
-- })
