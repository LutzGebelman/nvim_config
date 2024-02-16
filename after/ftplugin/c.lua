local keymap = vim.keymap


keymap.set('n', '<leader>r', ':!make<CR>', { desc = "Run make" })
