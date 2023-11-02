local plugins = {
  {
    "tpope/vim-fugitive",
    cmd = {"Git", "Gsplit", "Gdiffsplit", "Gvdiffsplit"}
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap",
    },
    config = true,
    event = "VeryLazy",
    keys = {{
      "<leader>vs", "<cmd>:VenvSelect<cr>",
      "<leader>vc", "<cmd>:VevnSelectCached<cr>"
    }},
    opts = {
      dap_enabled = true,
      search_workspace = true,
      parent = 10,
      notify_user_on_activate = true,
    },
    settings = {
      path = "~/dev/.venv/"
    }

  },
  {
    "aserowy/tmux.nvim",
    config = function ()
      require("tmux").setup()
      require("core.utils").load_mappings("tmux")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "lua-language-server",
        "ansible-language-server",
        "ansible-lint"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesList", "WorkspacesAdd", "WorkspacesOpen", "WorkspacesRemove" },
    config = function ()
      require("workspaces").setup {
        hooks = {
          open = "Telescope find_files",
        }
      }
    end
  },
  {
    "charludo/projectmgr.nvim",
    lazy = false
  },
  {
    'folke/which-key.nvim', --which-key overrides
    config = function (_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require('custom.configs.whichkey')
      require("which-key").setup(opts) -- <-- END lua/plugins/init.lua

  end
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    lazy=false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "pysan3/neorg-templates",
        dependencies = {
          "L3MON4D3/LuaSnip"
        },
      },
      { "nvim-neorg/neorg-telescope"},
      { "pritchett/neorg-capture"}
    },
    config = function()
      require("neorg").setup ({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.journal"] = {
            config = {
              strategy = "flat"
            }
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              default_workspace = 'kryses',
              use_popup = true,
              workspaces = {
                kryses = "~/notes/kryses",
              },
            },
          },
          ["external.templates"] = {},
          ["external.capture"] = {
            config = {
              templates = {
                description = "Default Capture",
                name = 'default',
                file = 'refile.norg',
                enabled = function()
                  return true
                end,
                datetree = true,
                headline = "Capture",
                path = {"Save", "refile"},
                query = "(headline1) @neorg-capture-target"
              }
            }
          },
          ["core.integrations.telescope"] = {},
        },
      })
    end,
  }
}
return plugins
