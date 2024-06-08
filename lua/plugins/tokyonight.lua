return {
  {
    "folke/tokyonight.nvim",

    event = "VimEnter",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "light", -- style for sidebars, see below
        floats = "light", -- style for floating windows
      },
      sidebars = { "packer" },
      day_brightness = 0.5, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      on_highlights = function(highlights, colors)
        -- highlights.IncSearch = { fg = colors.fg, bg = colors.blue7 }
        -- highlights.CurSearch = { fg = colors.fg, bg = colors.blue7 }
        -- highlights.LineNr = { fg = "", bg = "" }
        -- highlights.CursorLineNr = { fg = colors.yellow, bg = "" }
        -- highlights.Search = { fg = "", bg = "" }
        -- highlights.Cursor = { fg = "", bg = colors.blue0 }
        -- highlights.TelescopeBorder = { fg = colors.float, bg = "" }
        -- highlights.TelescopeNormal = { bg = "" }
        -- highlights.TelescopeSelection = { fg = "", bg = colors.bg_visual }
        -- highlights.TelescopeResultsIdentifier = { fg = "" }
        -- highlights.FloatBorder = { fg = colors.purple, bg = "" }
        highlights.NormalFloat = { bg = "#353949" } -- Set the background color
        -- highlights.Pmenu = { fg = "#AA2613" }
        -- highlights.PmenuThumb = { fg = "#AA2613" }
        -- highlights.PmenuSel = { fg = "#AA2613" }
        -- highlights.TabLineFill = { bg = "" }
        highlights.WinSeparator = { fg = "#1f2335" }
      end,
    },
  },
}
