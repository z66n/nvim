-- disable netrw: vim builtin file explorer for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- map leader key for keybinds
vim.g.mapleader = " "

-- mini.base16 color theme
theme = "tokyonight"

-- load lua modules
require("options")
require("mappings")
require("plugins")
