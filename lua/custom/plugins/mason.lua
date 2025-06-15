-- Installs lsp servers and enables automatically
return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
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
      -- 'stylua', -- Used to format Lua code
      -- 'prettierd', -- Used to format HTML code
    },
    automatic_enable = true,
  },
}
