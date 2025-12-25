-- Installs lsp servers and enables automatically
return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        ensure_installed = { 'stylua', 'prettierd' }, -- NOTE:: Not sure I'm actually using these...
      },
    },
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = {
      'lua_ls',
      'pyright',
      'ts_ls',
      'gopls',
      'html',
      'bashls',
      'dockerls',
      'yamlls',
      -- arduino
      'arduino_language_server',
    },
    automatic_enable = true,
  },
}
