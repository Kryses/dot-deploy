vim.opt.relativenumber = true
lvim.builtin.treesitter.ensure_installed = {
  'python'
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" } }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", args = {"--ignore=E203"}, filetypes={"python"} }, }

lvim.plugins = {
  {"christoomey/vim-tmux-navigator"},
  {"AckslD/swenv.nvim"},
  {"stevearc/dressing.nvim"},
    {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  { "ldelossa/nvim-dap-projects" }

}
lvim.debug = true
lvim.colorscheme = 'tokyonight'
lvim.transparent_window = true

local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

require('swenv').setup({
  get_venvs = function(venv_path)
    return require('swenv.api').get_venvs(venv_path)
  end,
  venvs_path = "/mnt/e/development/_environments",
  pose_set_venv = function()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

lvim.sections = {
    lualine_a = 'swenv', -- uses default options
    lualine_x = { 'swenv', icon = '<icon>' } -- passing lualine component options
}
