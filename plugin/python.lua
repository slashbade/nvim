capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").pyright.setup {capabilities = capabilities}

null_ls = require("null-ls")
null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.ruff
    }
}

