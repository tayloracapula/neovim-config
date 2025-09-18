local vim = vim

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.opt.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

require("config.keybinds")
require("config.lazy")
vim.cmd.colorscheme "catppuccin"
