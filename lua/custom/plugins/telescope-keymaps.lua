-- Custom telescope keymaps
-- These extend the upstream telescope configuration with additional shortcuts

-- Add keymap for searching with gitignored files included
vim.keymap.set('n', '<leader>sG', function()
  require('telescope.builtin').live_grep {
    additional_args = function()
      return { '--no-ignore', '--hidden' }
    end,
    prompt_title = 'Live Grep (including .gitignored)',
  }
end, { desc = '[S]earch by [G]rep (inc. gitignored)' })

return {}
