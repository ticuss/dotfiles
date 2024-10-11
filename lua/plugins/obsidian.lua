return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  cmd = {
    "ObsidianOpen",
    "ObsidianQuickSwitch",
    "ObsidianNew",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianYesterday",
  },
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/MyFiles/Obsidian_vaults",
      },
    },

    ui = {
      enable = true,
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      hl_group = {
        ObsidianBullet = { fg = "red", bold = false },
      },
    },

    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", "-a", "Firefox", "-g", url })
    end,
  },
}
