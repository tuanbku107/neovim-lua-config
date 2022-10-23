require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = { "sumeko_lua", "tsserver", "dockerls", "vuels" }
})
