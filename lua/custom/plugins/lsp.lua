-- LSP config for Neovim 0.11+
-- Built-in LSP client is easier to use now.
-- Still using mason-lspconfig to manage which LSP servers are installed.
-- And using nvim-lspconfig for default configurations of servers.
-- Then this set's some additional default behaviour for LSP servers.

-- Default global LSP configuration
vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

-- Enable common LSP features
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Enable LSP completion (i_CTRL-X CTRL-O)
    if client and client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- Enable LSP formatting
    -- if client and client:supports_method('textDocument/formatting') then
    --   vim.lsp.format.enable(true, client.id, args.buf, { autotrigger = true })
    -- end
  end,
})

-- vim.cmd 'set completeopt+=noselect'

-- Add border to floating lsp windows
vim.o.winborder = 'rounded'

vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
}

-- Manually enable given LSP servers (with configs from ./lsp/<server>.lua)
-- vim.lsp.enable { 'lua_ls', 'pyright', 'tsserver', 'gopls' }
-- NOTE: Mason set to automatically enable LSP servers

return {
  -- Status updates on LSP operations
  { 'j-hui/fidget.nvim', opts = {} },
}
