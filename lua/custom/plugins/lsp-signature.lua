-- Shows function signatures while typing in insert mode
-- Often the inline hints are hidden by copilot completions, but the floating window still shows up.

return {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  opts = {},
}
