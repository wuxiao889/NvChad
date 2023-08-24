-- local autocmd = vim.api.nvim_create_autojcmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local opt = vim.opt
local g = vim.g

g.mapleader = ","
opt.swapfile = false
opt.relativenumber = true
opt.showbreak="↪"

vim.cmd("hi LineNrAbove guifg=#cc6666 ctermfg=red")
vim.cmd("hi LineNrBelow guifg=#66cc66 ctermfg=green")
vim.cmd("hi Normal ctermbg=none")
vim.cmd("hi SignColumn ctermbg=none")
vim.cmd("hi Visual  guifg=#000000 guibg=#FFFFFF gui=none")
