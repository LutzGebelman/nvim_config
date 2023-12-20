local keymap = vim.keymap
keymap.terminal = {
    bid = nil
}

keymap.set('n', '\\', '<leader>')
keymap.set('n', '<leader>.', ':UndotreeToggle<CR>')

-- open the directory tree
keymap.set('n', '<C-\\>', ':Oil<CR>')

-- Tabulation
keymap.set('v', '<Tab>', ':s/./\\ \\ \\ \\ \\0/<CR>:nohl<CR>') -- Add a tab to each selected line
keymap.set('v', '<S-Tab>', ':s/\\ \\{4\\}//<CR>:nohl<CR>') -- Remove a tab from each selected line

keymap.set('n', '<esc>', ':sil nohl<CR>') -- Dismiss the highlight 
keymap.set('t', '<esc>', '<C-\\><C-n>') -- Exit terminal input on ESC

-- Buffers
keymap.set({'n', 'v'}, 'P', '"+p') -- Paste from a system clipboard (I know about ctrl-shift-v, I just wanted more comfortable way to do it)
keymap.set({'n', 'v'}, 'Y', '"+y') -- Copy to systemwide clipboard
keymap.set({'n', 'v'}, 'YY', '"+yy') -- Shortcut to copy line to the systemwide clipboard
keymap.set({'n', 'v'}, 'D', '"_d') -- Delete without copy
keymap.set({'n', 'v'}, 'DD', '"_dd') -- Shortcut to delete line without copy


-- Movement
-- Window Navigation
keymap.set('n', '<C-h>', ':wincmd h<CR>')
keymap.set('n', '<C-j>', ':wincmd j<CR>')
keymap.set('n', '<C-k>', ':wincmd k<CR>')
keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Up/down half page
keymap.set({ 'n', 'v' }, 'J', '<C-d>zz')
keymap.set({ 'n', 'v' }, 'K', '<C-u>zz')
keymap.set({ 'n', 'v' }, 'H', '<home>')
keymap.set({ 'n', 'v' }, 'L', '<end>')

-- tabs controll
-- keymap.set('n', '<leader>tt', ':tabnew<CR>')
-- keymap.set('n', '<leader>tq', ':tabclose<CR>')
-- keymap.set('n', '<leader>th', ':tabprevious<CR>')
-- keymap.set('n', '<leader>tl', ':tabnext<CR>')

-- Map undo to U
keymap.set('n', 'U', '<C-r>')

-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Open new window with a terminal
keymap.set('n', '<leader>tt', function()
    if vim.keymap.terminal.bid == nil then
        vim.cmd('40split')
        vim.cmd('wincmd j')
        vim.cmd('terminal')
        keymap.terminal.bid = vim.fn.bufnr()
    else
        if vim.fn.bufexists(keymap.terminal.bid) then
            vim.cmd('bd! ' .. keymap.terminal.bid)
        end
        keymap.terminal.bid = nil
    end
end)

-- Enable table mode
keymap.set('n', '<leader>tm', ':TableModeToggle<CR>')

-- Save all tabs and quit
keymap.set('n', 'QQ', function ()
    vim.cmd('wa')
    vim.cmd('qa')
end)
