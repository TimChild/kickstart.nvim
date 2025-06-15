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
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Enable LSP completion (i_CTRL-X CTRL-O)
    if client and client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    -- Enable LSP formatting
    if client and client:supports_method 'textDocument/formatting' then
      vim.lsp.format.enable(true, client.id, event.buf, { autotrigger = true })
    end

    if client and client:supports_method 'textDocument/documentHighlight' then
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup('lsp_highlight', { clear = false })

      vim.api.nvim_clear_autocmds { buffer = event.buf, group = augroup }

      autocmd({ 'CursorHold' }, {
        group = augroup,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({ 'CursorMoved' }, {
        group = augroup,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- Set up keymaps for LSP features (overrides some default ones)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Show the hover information for the word under your cursor.
    map('<leader>m', vim.lsp.buf.hover, 'Docu[m]entation')

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- Find references for the word under your cursor.
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    --
    -- -- Jump to the type of the word under your cursor.
    -- --  Useful when you're not sure what type a variable is and you want to see
    -- --  the definition of its *type*, not where it was *defined*.
    -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

    -- -- Fuzzy find all the symbols in your current document.
    -- --  Symbols are things like variables, functions, types, etc.
    -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    -- -- Fuzzy find all the symbols in your current workspace.
    -- --  Similar to document symbols, except searches over your entire project.
    -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

    -- -- WARN: This is not Goto Definition, this is Goto Declaration.
    -- --  For example, in C this would take you to the header.
    -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    if client and client:supports_method 'textDocument/inlayHint' then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
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
