local opt = vim.opt

-- basic
opt.scrolloff = 3
opt.mouse = "a"
opt.title = true
opt.titlestring = "%f"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.undofile = true
opt.cmdheight = 0
opt.termguicolors = true
opt.showmode = false
opt.cul = true
opt.autochdir = true

-- timeout stuff
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 10

-- status, tab, number, sign line
opt.ruler = false
opt.laststatus = 2
opt.number = true
opt.numberwidth = 1
opt.relativenumber = false
opt.signcolumn = "yes"

-- window, buffer, tabs
opt.switchbuf = "newtab"
opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.fillchars = {
	vert = "│",
	eob = " ",
	diff = " ",
	msgsep = " ",
}

-- text formatting
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.showmatch = true
opt.smartcase = true
opt.whichwrap:append("<>[]hl")
opt.autoindent = true
opt.smarttab = true
opt.softtabstop = 4
