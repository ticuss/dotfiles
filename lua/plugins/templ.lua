return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      servers = {
        templ = {
          filetypes = { "templ" },
          settings = {
            templ = {
              enable_snippets = true,
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "LazyFile", "VeryLazy" },
    opts_extend = { "ensure_installed" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "query",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "templ",
      },
    },
  },
}
