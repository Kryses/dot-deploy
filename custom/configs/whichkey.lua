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
    f = { name = "find...",
    },
    p = { name = "project..."},
    n = { name = 'neorg...',
      {
        r = {'<cmd>Neorg return<cr>', 'close'},
        w = {'<cmd>Telescope neorg switch_workspace<cr>', 'workspace'},
        i = {"<cmd>Neorg index<cr>", 'index'},
        t = {name = 'template...',
          {
            a = {':Neorg templates add ', 'add'},
            i = {':Neorg templates fload ', 'insert'},
          },
        },
        l = {name='link..',
          f = {'<cmd>Telescope neorg insert_file_link<cr>', 'file_link'},
          l = {'<cmd>Telescope neorg insert_link<cr>', 'link'}
        },
        j = {
          name = 'journal...',
          t = {'<cmd>Neorg journal today<cr>', 'today'}
        }
      }
    }
  },
}
