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

return M
