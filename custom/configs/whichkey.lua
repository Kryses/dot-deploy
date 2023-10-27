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
    o = { name = "org..."}
  },
}
