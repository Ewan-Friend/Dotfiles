-- Use lazy plugin manager
require("config.lazy")

-- set default shell to use commands like "ls" (hopefully)
vim.opt.shell = "/bin/sh"

-- Custom commands
vim.keymap.set('n', '<C-i>', 'i_<Esc>r', { noremap = true, silent = true })

vim.o.tabstop = 4          -- Display width of a tab character
vim.o.shiftwidth = 4       -- Width of an indentation step
vim.o.softtabstop = -1     -- Use shiftwidth for TAB/BS keys
vim.o.expandtab = true     -- Insert spaces instead of tab characters

vim.opt.clipboard = "unnamedplus"
