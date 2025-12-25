<<<<<<< HEAD
print 'Setting up keymaps -- 2025-02-01 -- I dont think this is being used...'
-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
=======
-- Custom keymaps

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

>>>>>>> sync-with-upstream
-- 2024-11-06 -- want to add this back in, but something wrong with setup that is causing errors on commenting
-- and dont want this confusing things further
--
--
-- -- -- Easier commenting (Note: / is _ in keybinding)
-- -- -- Normal mode
-- vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Toggle comment on current line" })
-- --
-- -- -- Visual mode
-- vim.keymap.set("x", "<C-_>", "gc", { remap = true, silent = true, desc = "Toggle comment on selected lines" })
-- --
-- -- -- Insert mode
-- vim.keymap.set("i", "<C-_>", function()
-- 	-- Exit insert mode and comment the current line (returning cursor to roughly where it was)
-- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>mxgcc`xi", true, false, true), "i", false)
-- end, { remap = true, silent = true, desc = "Toggle comment on current line from insert mode" })
