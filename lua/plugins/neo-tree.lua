return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    opts = {
      -- Enable filesystem + git status sources
      sources = { "filesystem", "git_status" },

      filesystem = {
        -- 🔒 SAFE DELETE (Trash only)
        delete_to_trash = true,
        confirm_delete = true,

        -- Show dotfiles & gitignored files
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },

        -- Better UX
        follow_current_file = {
          enabled = true,
        },

        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },

      -- Git status view (VS Code–like)
      git_status = {
        window = {
          position = "left",
          width = 32,
        },
      },

      window = {
        position = "left",
        width = 32,
        mappings = {
          ["H"] = "toggle_hidden", -- toggle dotfiles
          ["I"] = "toggle_gitignored", -- toggle gitignored
          ["gs"] = function()
            vim.cmd("Neotree git_status toggle") -- open git status view
          end,
        },
      },

      default_component_configs = {
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "?",
            ignored = "I",
            unstaged = "U",
            staged = "S",
            conflict = "C",
          },
        },
      },
    },
  },
}
