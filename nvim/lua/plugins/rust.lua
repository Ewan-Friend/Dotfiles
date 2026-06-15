return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			-- 1. Setup Mason so it can manage binaries
			require("mason").setup()

			-- 2. Ensure rust-analyzer is downloaded
			require("mason-lspconfig").setup({
				ensure_installed = { "rust_analyzer" },
			})

			-- 3. Modern Neovim 0.11+ Setup
			-- Instead of calling lspconfig.rust_analyzer.setup(), we use the new native API
			local config = vim.lsp.config and vim.lsp.config.rust_analyzer or {}

			-- Inject our custom settings safely
			config.settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					checkOnSave = true,
					procMacro = { enable = true },
				},
			}

			-- Start rust-analyzer manually on standard Rust filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function(args)
					vim.lsp.start(config, { bufnr = args.buf })
				end,
			})

			-- 4. Standard LSP Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
