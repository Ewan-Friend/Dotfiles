return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				-- Custom layouts or mappings go here
			},
		})

		-- Tell telescope to use the fzf-native dependency
		telescope.load_extension("fzf")

		-- Set up keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
	end,
}
