vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Auto format before save",
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
