local vim = vim -- A really stupind workaround to stop lsp from screaming at me everywhere about vim not being defined
local keymap = vim.keymap
local wk = require("which-key")
keymap.terminal = {
    bid = nil,
    make_new = function ()
    end,
    handle_term = function ()
        if not vim.keymap.terminal.bid then
            vim.fn.bufexists(keymap.terminal.bid)
            keymap.terminal.make_new()
            vim.cmd('40split')
            vim.cmd('wincmd j')
            vim.cmd('terminal')
            keymap.terminal.bid = vim.fn.bufnr()
            return
        end

        if vim.fn.bufwinid(keymap.terminal.bid) == -1 then
            vim.cmd('40split')
            vim.cmd('wincmd j')
            vim.cmd('buf ' .. keymap.terminal.bid)
            return
        end

        vim.cmd('bd! ' .. keymap.terminal.bid)
        keymap.terminal.bid = nil
    end
}

vim.g.mapleader = '\\'
keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = "Open undo tree" })

-- open the directory tree
keymap.set('n', '<leader><leader>', ':Oil<CR>', { desc = "File manager" })

keymap.set('n', '<esc>', ':sil nohl<CR>', { desc = "Dismiss highlight" }) -- Dismiss highlight 
keymap.set('t', '<esc>', '<C-\\><C-n>', { desc = "Exit terminal input" }) -- Exit terminal input

-- Buffers
keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = "Paste from the system clipboard" }) -- Paste from a system clipboard (I know about ctrl-shift-v, I just wanted more comfortable way to do it)
keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = "Yank to the system clipboard" }) -- Copy to systemwide clipboard
-- keymap.set({'n', 'v'}, '', '"+yy') -- Shortcut to copy line to the systemwide clipboard
keymap.set({'n', 'v'}, '<leader>d', '"_d', { desc = "Delete without copy" }) -- Delete without copy
-- keymap.set({'n', 'v'}, 'DD', '"_dd') -- Shortcut to delete line without copy


-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" }) -- Find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" }) -- Live grep
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" }) -- Buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" }) -- Help tags

-- Open new window with a terminal
keymap.set('n', '<leader>t', function() keymap.terminal.handle_term() end, { desc = "Open terminal on the bottom" })

-- Run make on a key (no shit)
keymap.set('n', '<leader>r', ':!make<CR>', { desc = "Run make" })

wk.register(
    {
        ["<leader>f"] = {name = "Telescope"}
    }
)
