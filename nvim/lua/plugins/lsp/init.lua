return {
	-- lsp config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			
		end,
	},
	
	-- mason
	{
		"williamboman/mason.nvim",
		opts = {
			ui = { border = "single" },
		},
		config = function(_, opts) require("mason").setup(opts) end,
	},

}
