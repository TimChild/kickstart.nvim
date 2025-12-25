-- Extend blink.cmp configuration to include Copilot as a source
return {
  'saghen/blink.cmp',
  opts = function(_, opts)
    -- Add copilot to the sources
    opts.sources = opts.sources or {}
    opts.sources.default = opts.sources.default or {}
    
    -- Add 'copilot' to the list of sources
    table.insert(opts.sources.default, 'copilot')
    
    -- Configure copilot provider
    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.copilot = {
      name = 'copilot',
      module = 'blink.compat.source',
      score_offset = 100, -- Prioritize copilot suggestions
      async = true,
    }
    
    return opts
  end,
}
