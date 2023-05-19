return {
  --    { 'farmergreg/vim-lastplace' },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "onsails/lspkind-nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local appended_source = {
        { name = "copilot" },
        unpack(opts.sources),
      }
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.sources = cmp.config.sources(appended_source)
      opts.formatting = {
        unpack(opts.formatting or {}),
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          local item_kind = item.kind
          if icons[item_kind] then
            item.kind = icons[item_kind]
          else
            item.kind = " "
          end
          item.menu = item_kind
          return item
        end,
      }

      -- opts.mapping = cmp.mapping.preset.insert({
      --         ["CR"] = cmp.mapping.confirm({
      --             select = true,
      --             behavior = cmp.ConfirmBehavior.Insert,
      --         }),
      --     })
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

      opts.window = opts.window or {}
      opts.window.completion = {
        border = "rounded",
        scrollbar = "║",
      }
      opts.window.documentation = {
        border = "rounded",
        scrollbar = "║",
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
      vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "String" })
    end,
  },
}
