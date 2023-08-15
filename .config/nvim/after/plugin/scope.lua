vim.opt.sessionoptions = { -- required
    "buffers",
    "tabpages",
    "globals",
}
local config = {
}
require('scope').setup(config)
require("telescope").load_extension("scope")

