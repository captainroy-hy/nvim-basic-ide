return {
  "kevinhwang91/nvim-bqf",
  commit = "8784eebf34371049b641646d00232c2603215297",
  event = "BufEnter",
  config = function()
    vim.cmd [[
      hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
      hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
      hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
      hi link BqfPreviewRange Search
    ]]
    require("bqf").setup {
      auto_enable = true,
      auto_resize_height = true, -- highly recommended enable
      preview = {
        win_height = 25,
        win_vheight = 25,
        delay_syntax = 80,
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        show_title = true,
        should_preview_cb = function(bufnr, qwinid)
          local ret = true
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local fsize = vim.fn.getfsize(bufname)
          if fsize > 100 * 1024 then
            -- skip file size greater than 100k
            ret = false
          elseif bufname:match "^fugitive://" then
            -- skip fugitive buffer
            ret = false
          end
          return ret
        end,
      },
      -- make `drop` and `tab drop` to become preferred
      func_map = {
        drop = "o",
        openc = "O",
        split = "<C-s>",
        tabdrop = "<C-t>",
        -- set to empty string to disable
        tabc = "",
        ptogglemode = "z,",
      },
      filter = {
        fzf = {
          action_for = {
            ["ctrl-s"] = "split",
            ["ctrl-t"] = "tab drop",
            ["ctrl-q"] = "signtoggle",
          },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
      },
    }
  end,
}
