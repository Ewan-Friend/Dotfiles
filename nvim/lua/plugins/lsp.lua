-- Can probably add rust laungage server to here from ./rust.lua
--
--
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- QML
				qmlls = {},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			-- Ensure Mason automatically installs qmlls if available
			if type(opts.ensure_installed) == "table" then
				table.insert(opts.ensure_installed, "qmlls")
			end
		end,
	},
}
