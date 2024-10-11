return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      marksman = {
        diagnostics = {
          disable = { "MD013" }, -- Disable line length check
        },
      },
    },
  },
}

-- return {
--   {
--     "nvimtools/none-ls.nvim",
--     enabled = false,
--   },
-- }

-- return {
--   {
--
--     "nvimtools/none-ls.nvim",
--     opts = function(_, opts)
--       local nls = require("null-ls")
--       opts.sources = {
--         nls.builtins.formatting.black.with({
--           timeout = 300000,
--           prefer_local = ".venv/bin",
--           extra_args = { "--line-length=88", "--fast" },
--         }),
--         nls.builtins.formatting.prettier,
--         nls.builtins.formatting.isort.with({
--           prefer_local = ".venv/bin",
--           timeout = 300000,
--           diagnostics_postprocess = function(diagnostic)
--             diagnostic.severity = vim.diagnostic.severity.INFO
--           end,
--         }),
--         nls.builtins.diagnostics.cspell.with({
--           method = nls.methods.DIAGNOSTICS_ON_SAVE,
--           diagnostics_postprocess = function(diagnostic)
--             diagnostic.severity = vim.diagnostic.severity.INFO
--           end,
--         }),
--         nls.builtins.code_actions.cspell,
--         nls.builtins.diagnostics.flake8.with({
--           extra_args = { "--max-line-length=88", "--ignore=E402,F841,F401,E302,E305,W503" },
--         }),
--         timeout = 300000,
--       }
--       return opts
--     end,
--   },
--
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         pyright = {
--           settings = {
--             python = {
--               analysis = {
--                 autoImportCompletions = true,
--                 autoSearchPaths = true,
--                 diagnosticMode = "openFilesOnly",
--                 typeCheckingMode = "basic",
--                 useLibraryCodeForTypes = true,
--               },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
