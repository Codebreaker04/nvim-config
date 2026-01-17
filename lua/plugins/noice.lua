return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
      },
    },
    views = {
      hover = {
        size = {
          max_width = 80,
        },
        win_options = {
          wrap = true,
        },
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline",
    },
  },
}
