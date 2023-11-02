local wk = require "which-key"
wk.register {
  ["<leader>"] = {
    g = { name = "git...",
      {
        s = { '<cmd>Git <cr>', 'status'},
      }
    },
    s = { name = "settings..."},
    r = { name = "refactor..."},
    f = { name = "find..."},
    p = { name = "project..."},
    n = { name = 'neorg...',
      {
        i = {"<cmd>Neorg index<cr>", 'index'},
        t = {name = 'template...',
          {
            a = {':Neorg templates add ', 'add'},
            i = {':Neorg templates fload ', 'insert'},
          }
        }

      }
    }
  },
}
