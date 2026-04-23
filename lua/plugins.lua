vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/romgrk/barbar.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mfussenegger/nvim-lint",
})

-- nvim-tree
require("nvim-tree").setup()

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
require("mini.comment").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

-- General
require("mini.basics").setup()
require("mini.bracketed").setup()

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },

  window = {
    delay = 0
  },
})

require("mini.cmdline").setup()
require("mini.extra").setup()
require('mini.git').setup()
require('mini.files').setup()
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

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require("mini.hues").setup({
	background = "#1e1e1e",
	foreground = "#cccccc",
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

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
