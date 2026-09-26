return {
	-- LSP: clangd for C/C++
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
					},
				},
			},
		},
	},

	-- Mason: make sure clangd + a debugger get installed
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "clangd", "codelldb" })
			end
		end,
	},

	-- Treesitter: C/C++/CMake parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "c", "cpp", "cmake" })
		end,
	},

	-- CMake integration (configure/build/run from inside nvim)
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			cmake_build_directory = "build",
		},
	},
}
