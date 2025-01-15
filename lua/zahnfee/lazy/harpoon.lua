return {
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		-- { "<leader>A", "<cmd>lua require('harpoon.mark').prepend_file()<cr>", desc = "Prepend file with harpoon" },
		{ "<leader>n", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
		{ "<leader>N", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
		{ "<leader>t", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		{ "<leader>+", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to harpoon file 1" },
		{ "<leader>[", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to harpoon file 2" },
		{ "<leader>{", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to harpoon file 3" },
		{ "<leader>(", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to harpoon file 4" },
	},
}

