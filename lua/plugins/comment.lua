return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    config = function(_, opts)
      require("Comment").setup(opts)

      -- Normal mode toggle comment
      vim.keymap.set(
        "n",
        "<C-_>",
        "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
        { noremap = true, silent = true }
      )
      -- Visual mode toggle comment
      vim.keymap.set(
        "v",
        "<C-_>",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
