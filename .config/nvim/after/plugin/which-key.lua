wk = require("which-key")
config = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "shadow", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
}
wk.setup(config)

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local ts_builtin = require("telescope.builtin")

local keymap = {
    -- Root
    ['<leader>s'] = {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Rename Current'},

    -- Project
    ['<leader>p'] = { name = 'Project...' },
    ['<leader>pp'] = { "<cmd>NnnPicker<CR>", "Picker" },
    ['<leader>pf'] = { ts_builtin.find_files, "Find Files" },
    ['<leader>ps'] = { function() ts_builtin.grep_string({ search = vim.fn.input("Grep > ") }); end, "Find in Files" },
    ['<leader>pr'] = { ts_builtin.oldfiles, "Recent Files" },

    -- Buffers
    ['<leader>b'] = { name = 'Buffers...' },
    ['<leader>bb'] = { '<cmd>bprevious<cr>', 'Previous Buffer'},
    ['<leader>bn'] = { '<cmd>bnext<cr>', 'Next Buffer'},
    ['<leader>bq'] = { '<cmd>bdelete<cr>', 'Close Buffer'},

    -- Harpoon
    ['<leader>r'] = { name = 'Harpoon...'},
    ['<leader>rr'] = {ui.toggle_quick_menu, 'Quick Menu'},
    ['<leader>ra'] = {mark.add_file, 'Add File'},
    ['<leader>r1'] = {function () ui.nav_file(1) end, 'Goto 1'},
    ['<leader>r2'] = {function () ui.nav_file(2) end, 'Goto 2'},
    ['<leader>r3'] = {function () ui.nav_file(2) end, 'Goto 3'},
    ['<leader>r4'] = {function () ui.nav_file(2) end, 'Goto 4'},

    --Yank
    ['<leader>y'] = { name='Yank..' },
    ['<leader>yy'] = {"\"+yy", 'Clipboard', mode='v'},
    ['<leader>yY'] = {":'<,'>!clip.exe<cr>", 'System Clipboard', mode='v'},

}
wk.register(keymap)
