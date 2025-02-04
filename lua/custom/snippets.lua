print 'loading snippets -- 2025-02-01 -- I dont know why this doesnt print... it is loading'
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

-- Print to debug whether this file is running
print 'loading extra luasnips'

local date = function()
  return { os.date '%Y-%m-%d' }
end

local function example_fn(
  args,
  ---@diagnostic disable-next-line: unused-local
  parent, -- parent snippet or parent node
  user_args
)
  return {
    '<example func start>',
    'first-insert,first-line: ' .. args[1][1],
    'second-insert,first-line: ' .. args[2][1],
    'user args: ' .. user_args,
    '<example func end>',
  }
end

ls.add_snippets('all', {
  -- Simple text snippet as example
  s('hello-world-snippet', { t 'Hello World!' }),
  -- Snipped that uses a function node to generate the date
  s({
    trig = 'date',
    namr = 'Date',
    dscr = 'Date in the form of YYYY-MM-DD',
  }, { f(date, {}) }),
  -- Example with inserts
  s('luasnip-inserts-example', {
    i(1),
    t '<-first insert|',
    f(
      example_fn,
      { 1, 2 }, -- Node indices to pass in
      { user_args = { 'some user args' } }
    ),
    t '|second insert->',
    i(2),
    t '<second insert|',
    i(0), -- i(0) sets the exit point
  }),
})
