vim.opt.termguicolors = true
vim.opt.mousemoveevent = true

local config = {
    options = {
        mode = "buffer",
        indicator = {
            style = 'underline'
        },
        diagnostics = 'nvim_lsp',
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        separator_style = 'slant',
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end
        },

}
require("bufferline").setup(config)
