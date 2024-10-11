return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = true,
          enabled = true,
        },
        ruff_lsp = {
          autostart = false,
          mason = false,
          enabled = false,
        },
      },
    },
  },
}
