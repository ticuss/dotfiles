return {

  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- Set up linters by file type
    opts.linters_by_ft.markdown = { "markdownlint" }
    opts.linters_by_ft.python = { "ruff" }

    -- Configure markdownlint
    require("lint").linters.markdownlint.args = {
      "--disable", -- Disable specific rules
      "MD013", -- Line length rule
      "--", -- Separator for additional arguments
    }
  end,
}
