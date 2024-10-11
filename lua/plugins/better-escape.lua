return {

  event = "InsertEnter",
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
  opts = {
    mapping = { "jj" },
    timeout = 200,
  },
}
