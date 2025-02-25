return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    ensure_installed = {
      "sqlfmt",
      "stylua",
      "black",
      "prettier",
      "isort",
      "sqlfmt",
      "sqlfluff",
      "sqlfluff-templater-dbt",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      sql = { "sqlfluff" },
      templ = { "templ" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
}

-- return {
--   "stevearc/conform.nvim",
--   opts = {
--     -- Define your formatters
--     formatters_by_ft = {
--       lua = { "stylua" },
--       pyhton = { "isort", "black" },
--       javascript = { "prettier" },
--       go = { "goimports", "gofumpt" },
--     },
--     -- Customize formatters
--     formatters = {
--       shfmt = {
--         prepend_args = { "-i", "2" },
--       },
--     },
--   },
--   init = function()
--     -- If you want the formatexpr, here is the place to set it
--     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--   end,
-- }
