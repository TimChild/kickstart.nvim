---@diagnostic disable: unused-local
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

local date = function()
  return { os.date '%Y-%m-%d' }
end

ls.add_snippets('all', {
  -- Simple text snippet as example
  -- Snipped that uses a function node to generate the date
  s({
    trig = 'date',
    namr = 'Date',
    dscr = 'Date in the form of YYYY-MM-DD',
  }, { f(date, {}) }),
  -- Example with inserts
})
