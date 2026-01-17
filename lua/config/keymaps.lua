-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "C-s", function()
  vim.cmd("silent! write")
end, { desc = "Save file (insert mode)" })

-- <leader>dd → show diagnostics (no focus)
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "cursor",
    border = "rounded",
    source = "always",
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  })
end, { desc = "Diagnostics: show" })

-- <leader>dD → show diagnostics (focused & copyable)
vim.keymap.set("n", "<leader>dD", function()
  vim.diagnostic.open_float(nil, {
    focus = true,
    scope = "cursor",
    border = "rounded",
    source = "always",
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  })
end, { desc = "Diagnostics: show & focus" })
