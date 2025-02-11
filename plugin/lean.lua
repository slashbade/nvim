-- Always show sign column.
-- The sign column is used by the LSP support to show diagnostics
-- (the E, W, etc. characters on the side)
-- as well as by the Lean plugin to show the orange bars.
-- By default the sign column is only shown if there are signs to show,
-- which means the buffer will constantly jump right and left.
vim.opt.signcolumn = "yes:1"

local function on_attach(_, bufnr)
    local function cmd(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { noremap = true, buffer = true })
    end

    -- Autocomplete using the Lean language server
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Support for triggering code actions (e.g. "Try this:" suggestions from `simp?`)
    cmd('n', '<leader>a', vim.lsp.buf.code_action)
    cmd('i', '<C-a>', vim.lsp.buf.code_action)

    -- <leader>n will jump to the next Lean line with a diagnostic message on it
    -- <leader>N will jump backwards
    cmd('n', '<leader>n', function() vim.diagnostic.goto_next{popup_opts = {show_header = false}} end)
    cmd('n', '<leader>N', function() vim.diagnostic.goto_prev{popup_opts = {show_header = false}} end)

    -- <leader>K will show all diagnostics for the current line in a popup window
    cmd('n', '<leader>K', function() vim.diagnostic.open_float(0, { scope = "line", header = false, focus = false }) end)

    -- <leader>q will load all errors in the current lean file into the location list
    -- (and then will open the location list)
    -- see :h location-list if you don't generally use it in other vim contexts
    cmd('n', '<leader>q', vim.diagnostic.setloclist)
end

-- Enable lean.nvim, and enable abbreviations and mappings
require('lean').setup{
    lsp = { on_attach = on_attach },
    mappings = true,
}

-- Update error messages even while you're typing in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { spacing = 4 },
    update_in_insert = true,
  }
)
