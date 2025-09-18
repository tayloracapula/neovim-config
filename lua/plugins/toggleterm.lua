return{
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
	require("toggleterm").setup{
	    size = 20,
	    open_mapping = [[<c-\>]],
	    start_in_insert = true,
	    direction = "horizontal",
	}
	vim.keymap.set("n","<leader>tt", "<cmd>ToggleTerm name=Terminal<cr>",{desc = "Toggle terminal"})
	vim.keymap.set("n","<leader>lg", '<cmd>TermExec cmd="lazygit" direction=float name=lazygit go_back=0<cr>',{desc = "Open LazyGit"})
     end,
}
