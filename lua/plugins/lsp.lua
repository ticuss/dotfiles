return {
  { "fatih/vim-go" }, -- Go
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = {
        nls.builtins.formatting.black.with({
          timeout = 60000,
          prefer_local = ".venv/bin",

          extra_args = { "--line-length=88", "--fast" },
        }),
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.isort.with({
          prefer_local = ".venv/bin",
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.INFO
          end
        }),
        nls.builtins.diagnostics.cspell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.INFO
          end,
        }),
        nls.builtins.code_actions.cspell,
        nls.builtins.diagnostics.flake8.with({
          extra_args = { "--max-line-length=88", "--ignore=E402,F841,F401,E302,E305,W503" },
        }),
        nls.builtins.formatting.golines,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      }
      return opts
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              analyses = {
                assign = true,
                atomic = true,
                bools = true,
                composites = true,
                copylocks = true,
                deepequalerrors = true,
                embed = true,
                errorsas = true,
                fieldalignment = true,
                httpresponse = true,
                ifaceassert = true,
                loopclosure = true,
                lostcancel = true,
                nilfunc = true,
                nilness = true,
                nonewvars = true,
                printf = true,
                shadow = true,
                shift = true,
                simplifycompositelit = true,
                simplifyrange = true,
                simplifyslice = true,
                sortslice = true,
                stdmethods = true,
                stringintconv = true,
                structtag = true,
                testinggoroutine = true,
                tests = true,
                timeformat = true,
                unmarshal = true,
                unreachable = true,
                unsafeptr = true,
                unusedparams = true,
                unusedresult = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
              },
              hoverKind = "FullDocumentation",
              linkTarget = "pkg.go.dev",
              usePlaceholders = true,
              vulncheck = "Imports",
            },
          },
        },
      },
    },
  },
}
