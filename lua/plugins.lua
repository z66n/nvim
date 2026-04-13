vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/romgrk/barbar.nvim",
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mfussenegger/nvim-lint",
})

-- nvim-tree
require("nvim-tree").setup()

-- nvim-colorizer
require("colorizer").setup()

-- nvim-treesitter
vim.schedule(function()
	require("nvim-treesitter").setup({
		ensure_installed = {
			"lua",
			"vim",
			"bash",
			"python",
			"javascript",
			"html",
			"css",
			"nix",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	})
end)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- linter and formatter
require("conform").setup({
	formatters_by_ft = {
		-- nix = { "alejandra" },
		sql = { "sqruff" },
		lua = { "stylua" },
		javascript = { "biome" },
		python = { "ruff_format" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
		-- async = false,
	},
})

local lint = require("lint")

lint.linters_by_ft = {
	-- nix = { "statix" },
	sql = { "sqruff" },
	python = { "ruff" },
	javascript = { "biomejs" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		lint.try_lint()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "nix" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- mini.nvim
-- Text editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.operators").setup()
require("mini.surround").setup()

-- General
require("mini.basics").setup()
require("mini.bracketed").setup()
require("mini.bufremove").setup()
-- require('mini.deps').setup()
require("mini.extra").setup()
-- require('mini.files').setup()
require("mini.pick").setup()
require("mini.sessions").setup({
	file = "",
})

-- Appearance
require("mini.animate").setup()
-- require("mini.base16").setup({
-- 	palette = require("colors." .. theme),
-- 	use_cterm = true,
-- })
-- require("mini.colors").setup()
require("mini.hues").setup({
	background = "#1e1e1e",
	foreground = "#cccccc",
})
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.starter").setup({
	header = [[
███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
  ]],
})
require("mini.statusline").setup()
-- require('mini.tabline').setup()
