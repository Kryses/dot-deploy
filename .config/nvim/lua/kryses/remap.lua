vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-e>", "<cmd>NnnExplorer<CR>")
vim.keymap.set("t", "<C-e>", "<cmd>NnnExplorer %:p:h<CR>")

vim.keymap.set("t", "<C-l>", '<cmd>lua require("tmux").move_right()<cr>')
vim.keymap.set("t", "<C-h>", '<cmd>lua require("tmux").move_left()<cr>')
vim.keymap.set("t", "<C-k>", '<cmd>lua require("tmux").move_up()<cr>')
vim.keymap.set("t", "<C-j>", '<cmd>lua require("tmux").move_down()<cr>')


vim.keymap.set("n", "<leader>bb", '<cmd>bprevious<cr>')
vim.keymap.set("n", "<leader>bn", '<cmd>bnext<cr>')

