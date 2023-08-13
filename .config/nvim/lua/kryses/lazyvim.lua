local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	{ 'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
},
{
	'nvim-treesitter/nvim-treesitter',
	version = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		init = function()
			require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
			load_textobjects = true
		end,
	},
},
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		},
	},
    {
        'neoclide/coc.nvim',
        build = 'yarn install --frozen-lockfile'
    },
    {
        'yaegassy/coc-ansible',
        build = 'yarn install --frozen-lockfile'
    },
    {
        'aserowy/tmux.nvim',
    }
}
)
