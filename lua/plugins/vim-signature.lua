return function()
	require("lsp_signature").setup()
	vim.g.SignatureMarkTextHLDynamic = 1
	vim.g.SignatureMarkerTextHLDynamic = 1
end
