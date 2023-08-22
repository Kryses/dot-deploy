local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpm"] = {
      function ()
        require("dap-python").test_method()
      end
    },
    ["<leader>dpc"] = {
      function ()
        require("dap-python").test_class()
      end
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
    ["<C-l>"] = {"<cmd>lua require('tmux').move_right()<cr>"},
    ["<C-h>"] = {"<cmd>lua require('tmux').move_left()<cr>"},
    ["<C-j>"] = {"<cmd>lua require('tmux').move_bottom()<cr>"},
    ["<C-k>"] = {"<cmd>lua require('tmux').move_top()<cr>"},
  },
  t = {
    ["<C-l>"] = {"<cmd>lua require('tmux').move_right()<cr>"},
    ["<C-h>"] = {"<cmd>lua require('tmux').move_left()<cr>"},
    ["<C-j>"] = {"<cmd>lua require('tmux').move_bottom()<cr>"},
    ["<C-k>"] = {"<cmd>lua require('tmux').move_top()<cr>"},
  },
}

return M
