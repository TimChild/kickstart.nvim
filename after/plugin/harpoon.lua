local harpoon = require 'harpoon'
harpoon:setup {}

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon add (current file)' })
vim.keymap.set('n', '<leader>h', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon toggle' })

vim.keymap.set('n', '<leader>j', function()
  harpoon:list():select(1)
end, { desc = 'Harpoon 1' })
vim.keymap.set('n', '<leader>k', function()
  harpoon:list():select(2)
end, { desc = 'Harpoon 2' })
vim.keymap.set('n', '<leader>l', function()
  harpoon:list():select(3)
end, { desc = 'Harpoon 3' })
vim.keymap.set('n', '<leader>;', function()
  harpoon:list():select(4)
end, { desc = 'Harpoon 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>p', function()
  harpoon:list():prev()
end, { desc = 'Harpoon previous' })
vim.keymap.set('n', '<leader>n', function()
  harpoon:list():next()
end, { desc = 'Harpoon next' })
