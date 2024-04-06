vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('i','øø','{')
vim.keymap.set('i','ææ','}')
vim.keymap.set('i','ØØ','[')
vim.keymap.set('i','ÆÆ',']')
vim.keymap.set('i','åå','{}')
vim.keymap.set('i','ÅÅ','()')

vim.keymap.set('n', 'JJ', '<C-W>j')
vim.keymap.set('n', 'KK', '<C-W>k')
vim.keymap.set('n', 'HH', '<C-W>h')
vim.keymap.set('n', 'LL', '<C-W>l')
vim.keymap.set('n', '==', '<C-W>=')
vim.keymap.set('n', '<<', '5<C-w><')
vim.keymap.set('n', '>>', '5<C-w>>')
