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
  keys = {
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Create a new note in Obsidian" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch to another note" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks for the current note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search for notes" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "Create Daily Note" },
    { "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", desc = "Create New Templated Note" },
  },
  opts = {
    workspaces = {
      {
        name = "test",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian_vaults/My-Vault/",
      },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",

      substitutions = {},
    },
    new_notes_location = "new_zettels",
    daily_notes = {
      folder = "dailies",
      template = "templates/daily.md",
    },
    mappings = {
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
    ui = {
      enable = false,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianTodo" },
      },
    },

    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", "-a", "Firefox", "-g", url })
    end,
  },

  ---@param img string
  follow_img_func = function(img)
    -- Get the full path of the image
    local full_img_path = vim.fn.expand(img)

    -- Use different commands based on the OS
    if vim.fn.has("mac") == 1 then
      vim.fn.jobstart({ "qlmanage", "-p", full_img_path }) -- MacOS Quick Look
    elseif vim.fn.has("unix") == 1 then
      vim.fn.jobstart({ "xdg-open", full_img_path }) -- Linux
    elseif vim.fn.has("win32") == 1 then
      vim.cmd(':silent exec "!start ' .. full_img_path .. '"') -- Windows
    end
  end,
}
