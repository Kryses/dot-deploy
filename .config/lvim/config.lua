vim.opt.relativenumber = true
lvim.plugins = {
  {"christoomey/vim-tmux-navigator"},
  {"AckslD/swenv.nvim"}

}
lvim.debug = true
lvim.colorscheme = 'tokyonight'
lvim.transparent_window = true
print(lvim)

require('swenv.api').pick_venv()
require('swenv.api').get_current_venv()

require('swenv').setup({
  -- Should return a list of tables with a `name` and a `path` entry each.
  -- Gets the argument `venvs_path` set below.
  -- By default just lists the entries in `venvs_path`.
  get_venvs = function(venvs_path)
    return require('swenv.api').get_venvs(venvs_path)
  end,
  -- Path passed to `get_venvs`.
  venvs_path = vim.fn.expand('/mnt/e/development/_environments'),
  -- Something to do after setting an environment, for example call vim.cmd.LspRestart
  post_set_venv = nil,
})

lvim.sections = {
    lualine_a = 'swenv', -- uses default options
    lualine_x = { 'swenv', icon = '<icon>' } -- passing lualine component options
}
