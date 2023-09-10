local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpm"] = {
      function ()
        require("dap-python").test_method()
      end,
      "Test Method"
    },
    ["<leader>dpc"] = {
      function ()
        require("dap-python").test_class()
      end,
      "Test Class"
    },
    ["<leader>dpo"] = {
      function ()
        local dapui = require("dapui")
        dapui.open()
      end

    },
    ["<leader>dpq"] = {
      function ()
        local dapui = require("dapui")
        dapui.close()
      end
    },
  }
}
M.tmux = {
  n = {
    ["<C-l>"] = {"<cmd>lua require('tmux').move_right()<cr>", "Move Right"},
    ["<C-h>"] = {"<cmd>lua require('tmux').move_left()<cr>", "Move Left"},
    ["<C-j>"] = {"<cmd>lua require('tmux').move_bottom()<cr>", "Move Down"},
    ["<C-k>"] = {"<cmd>lua require('tmux').move_top()<cr>", "Move Up"},
  },
  t = {
    ["<C-l>"] = {"<cmd>lua require('tmux').move_right()<cr>", "Move Right"},
    ["<C-h>"] = {"<cmd>lua require('tmux').move_left()<cr>", "Move Left"},
    ["<C-j>"] = {"<cmd>lua require('tmux').move_bottom()<cr>", "Move Down"},
    ["<C-k>"] = {"<cmd>lua require('tmux').move_top()<cr>", "Move Up"},
  },
}

M.lspconfig = {
  n = {
    ["<leader>l"] = {"LSP"},
  },
}

return M
