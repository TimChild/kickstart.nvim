-- GitHub Copilot integration using copilot.lua with inline suggestions
-- Works alongside blink.cmp (copilot shows as ghost text, blink shows in menu)
return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = {
          position = 'bottom',
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false, -- Don't hide during blink.cmp completion
        debounce = 75,
        keymap = {
          accept = false, -- We'll set up a smarter Tab mapping below
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        -- Enable for all filetypes by explicitly listing them
        -- Using ['*'] = true doesn't always work, so we list common ones
        python = true,
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        lua = true,
        go = true,
        rust = true,
        c = true,
        cpp = true,
        java = true,
        ruby = true,
        php = true,
        html = true,
        css = true,
        scss = true,
        json = true,
        yaml = true,
        toml = true,
        markdown = true,
        sh = true,
        bash = true,
        zsh = true,
        vim = true,
        sql = true,
        -- Disable for these
        [''] = false,
        ['.'] = false,
        gitcommit = false,
        gitrebase = false,
        help = false,
      },
      copilot_node_command = 'node',
      server_opts_overrides = {},
    }
    
    -- Smart Tab: accept Copilot suggestion if available, otherwise normal tab behavior
    vim.keymap.set('i', '<Tab>', function()
      if require('copilot.suggestion').is_visible() then
        require('copilot.suggestion').accept()
      else
        -- Fallback to normal tab (or snippet expansion if you use snippets)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
      end
    end, { desc = 'Accept Copilot suggestion or insert tab' })
    
    -- Add keybinding to toggle Copilot
    vim.keymap.set('n', '<leader>tc', '<cmd>Copilot toggle<CR>', { desc = '[T]oggle [C]opilot' })
  end,
}
