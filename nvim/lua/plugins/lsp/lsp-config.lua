return {

	-- lsp config
	{
		"neovim/nvim-lspconfig",

		event = { "BufReadPre", "BufReadPost", "BufNewFile" },

		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				["rust_analyzer"] = function()
					require("rust-tools").setup({})
				end,
			})

			local lspconfig = require("lspconfig")

			if vim.lsp.inlay_hint then
				vim.keymap.set("n", "<Space>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { desc = "Toggle Inlay Hints" })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- ╭─────────╮
					-- │ KEYMAPS │
					-- ╰─────────╯
					local bufopts = function(desc)
						return { buffer = ev.buf, desc = desc }
					end
					-- All lsp keymaps starts with gr expept K.
					-- Default lsp keymaps. Setting the keymaps again, only to change the description.
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover({ border = "single" })
					end, bufopts("Hover"))
					vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, bufopts("LSP Code Action"))
					vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufopts("LSP Rename"))
					vim.keymap.set("n", "grr", vim.lsp.buf.references, bufopts("LSP References"))
					-- Custom lsp keymaps.
					vim.keymap.set("n", "grd", vim.lsp.buf.definition, bufopts("LSP Go to Definition"))
					vim.keymap.set("n", "grD", vim.lsp.buf.declaration, bufopts("LSP Go to Declaration"))
					vim.keymap.set("n", "gri", vim.lsp.buf.implementation, bufopts("LSP Go to Implementation"))
					vim.keymap.set("n", "grf", function()
						vim.lsp.buf.format({ async = true })
					end, bufopts("LSP Formatting"))
					vim.keymap.set("n", "grk", function()
						vim.lsp.buf.signature_help({ border = "single" })
					end, bufopts("LSP Singature Help"))
					vim.keymap.set("n", "grs", vim.lsp.buf.document_symbol, bufopts("LSP Document Symbols"))
					vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, bufopts("LSP Type Definition"))
					vim.keymap.set("n", "grwa", vim.lsp.buf.add_workspace_folder, bufopts("LSP Add Workspace Folder"))
					vim.keymap.set(
						"n",
						"grwr",
						vim.lsp.buf.remove_workspace_folder,
						bufopts("LSP Remove Workspace Folder")
					)
					vim.keymap.set("n", "grwl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, bufopts("LSP List Workspace Folder"))

					-- Get client
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- ╭─────────────╮
					-- │ INLAY HINTS │
					-- ╰─────────────╯
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true)
					else
						vim.lsp.inlay_hint.enable(false)
					end
				end,
			})

			-- ╭────────────────────╮
			-- │ TOGGLE INLAY HINTS │
			-- ╰────────────────────╯
			if vim.lsp.inlay_hint then
				vim.keymap.set("n", "<Space>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { desc = "Toggle Inlay Hints" })
			end

			vim.diagnostic.config({
				virtual_text = {
					prefix = "", -- Could be '●', '▎', │, 'x', '■', , 
				},
				jump = {
					float = true,
				},
				float = { border = "single" },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
				},
			})
		end,
	},
}
