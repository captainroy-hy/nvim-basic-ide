return {
  "yorickpeterse/nvim-pqf",
  event = "BufEnter",
  config = function ()
    require('pqf').setup()
  end
}
