return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    -- build = ":Neorg sync-parsers",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extensions = "all",
            },
          },
          ["core.ui"] = {},
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.ui.calendar"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/MyFiles/notes",
                journal = "~/MyFiles/journal",
              },
            },
          },
        },
      })
    end,
  },
}
