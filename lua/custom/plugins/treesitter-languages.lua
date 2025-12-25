-- Extend treesitter with additional languages beyond what upstream provides
-- Upstream includes: bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc
return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      -- Add your additional languages here
      'python',
      'typescript',
      'javascript',
      'tsx',
      'go',
      'toml',
      'yaml',
      'json',
      'jsonc',
    },
  },
}
