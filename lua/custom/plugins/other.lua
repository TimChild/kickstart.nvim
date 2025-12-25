-- For quickscope to only highlight on f, F, t, T. Necessary to set before plugin is loaded
-- https://github.com/unblevable/quick-scope/issues/98

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

return {
  -- Plugins not included in upstream kickstart

  'chrisbra/Colorizer', -- Highlight color codes in files (like #FF5733)

  {
    'unblevable/quick-scope', -- Highlight characters for quick f/F/t/T movement
    config = function()
      -- Note: vim.g.qs_highlight_on_keys must be set before plugin loads (done above)
    end,
  },
}
