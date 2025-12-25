-- GitHub Copilot integration using the modern LSP approach
-- This integrates with blink.cmp for better completion experience
return {
  {
    -- Copilot.lua provides the copilot language server integration
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false, -- Disable panel, use blink.cmp instead
        },
        suggestion = {
          enabled = false, -- Disable inline suggestions, use blink.cmp instead
        },
        filetypes = {
          -- Enable for most filetypes (set to true to override internal defaults)
          ['*'] = true, -- Enable for all filetypes by default
          -- Explicitly enable for common filetypes to override any internal blocks
          python = true,
          javascript = true,
          typescript = true,
          lua = true,
          go = true,
          rust = true,
          markdown = true,
          yaml = true,
          json = true,
          toml = true,
          sh = true,
          bash = true,
          c = true,
          cpp = true,
          html = true,
          css = true,
          -- Disable for specific types if needed
          gitcommit = false,
          gitrebase = false,
          help = false,
        },
        copilot_node_command = 'node',
      }
    end,
  },
  {
    -- Copilot-cmp integrates copilot with nvim-cmp and blink.cmp
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
