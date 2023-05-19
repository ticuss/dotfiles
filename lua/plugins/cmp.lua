return {

  -- Use <tab> for completion and snippets (super tab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "onsails/lspkind-nvim",
  },

  -- then: setup super tab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = true,
        dependencies = {
          { "zbirenbaum/copilot.lua", config = true },
        },
      },
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      opts.sources = vim.tbl_extend("force", opts.sources, {
        { name = "copilot",  priority = 1000 },
        { name = "nvim_lsp", priority = 120 },
      })

      local lspkind = require("lspkind")
      opts.formatting = vim.tbl_extend("force", opts.formatting, {
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 5000,
          symbol_map = { Copilot = "" },
        }),
      })
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

}
