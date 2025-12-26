-- Custom keymaps plugin
-- This ensures keymaps are loaded properly as part of the plugin system

return {
  -- This is a "virtual" plugin that just sets up keymaps
  -- No actual plugin to install, just configuration
  {
    'nvim-lua/plenary.nvim', -- Depends on something that already exists
    config = function()
      -- Copy to system clipboard
      vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
      vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })

      -- Shift+Tab to unindent (decrease indent)
      -- Works in insert, normal, and visual modes
      vim.keymap.set('i', '<S-Tab>', '<C-d>', { desc = 'Unindent line' })
      vim.keymap.set('n', '<S-Tab>', '<<', { desc = 'Unindent line' })
      vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Unindent selection' })

      -- Tab to indent in visual mode (keeps selection)
      vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent selection' })
    end,
  },
}
