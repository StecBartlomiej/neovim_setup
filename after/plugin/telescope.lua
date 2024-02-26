local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [h]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [k]eymap' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [f]ile' })
vim.keymap.set('n', '<leader>ss', builtin.oldfiles, { desc = '[?] Search recent file' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })


