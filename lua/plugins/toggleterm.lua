return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local ok, toggleterm = pcall(require, "toggleterm")
      if not ok then
        vim.notify("toggleterm.nvim not found!", vim.log.levels.ERROR)
        return
      end

      toggleterm.setup({
        size = 20,
        direction = "horizontal",
        open_mapping = nil,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- Store the currently focused terminal
      local focused_term = nil

      -- Function to create a new terminal and set it as focused
      local function open_new_terminal()
        focused_term = Terminal:new({ direction = "horizontal", hidden = true })
        focused_term:open()
      end

      -- Toggle the focused terminal
      local function toggle_focused()
        if focused_term then
          focused_term:toggle()
        else
          -- if no terminal exists, open one
          open_new_terminal()
        end
      end

      -- Kill the focused terminal
      local function kill_focused()
        if focused_term then
          if focused_term:is_open() then
            focused_term:close()
          end
          focused_term = nil
        else
          vim.notify("No terminal to kill", vim.log.levels.WARN)
        end
      end

      -- Keymaps
      vim.keymap.set("n", "<leader>tt", toggle_focused, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>tn", open_new_terminal, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>td", kill_focused, { noremap = true, silent = true })

      -- Terminal mode keymaps
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
    end,
  },
}
