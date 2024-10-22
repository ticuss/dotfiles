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
        name = "test",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian_vaults/My-Vault/",
      },
    },
    ui = {
      enable = false,
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

  ---@param img string
  follow_img_func = function(img)
    vim.fn.jobstart({ "qlmanage", "-p", img }) -- Mac OS quick look preview
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
    -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
  end,
}
