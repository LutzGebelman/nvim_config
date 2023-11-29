local keymap = vim.keymap
keymap.terminal = {
    bid = nil
}

-- WARN: No clue what this is for, so gona leave this here untill something breaks

-- local opts = {
--     mode = 'n', -- NORMAL mode
--     -- prefix: use '<leader>f' for example for mapping everything related to finding files
--     -- the prefix is prepended to every mapping part of `mappings`
--     prefix = '',
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
--     expr = false, -- use `expr` when creating keymaps
-- }


keymap.set('n', '.', ':UndotreeToggle<CR>')

-- open the directory tree
keymap.set('n', '<C-\\>', ':Oil<CR>')

-- Tabulation
keymap.set('v', '<Tab>', ':s/./\\ \\ \\ \\ \\0/<CR>:nohl<CR>') -- Add a tab to each selected line
keymap.set('v', '<S-Tab>', ':s/\\ \\{4\\}//<CR>:nohl<CR>') -- Remove a tab from each selected line
-- NOTE: I have no use for this for now
-- keymap.set('n', '<F8>', ':lua require'dap'.toggle_breakpoint()<CR>')
-- keymap.set('n', '<F5>', ':lua require'dap'.continue()<CR>')
-- keymap.set('n', '<F6>', function ()
--     require('dap.ext.vscode').load_launchjs('${workspaceFolder}/launch.json')
-- end)
-- keymap.set('n', '<F10>', ':lua require'dap'.step_over()<CR>')
-- keymap.set('n', '<F11>', ':lua require'dap'.step_into()<CR>')
-- keymap.set('n', 'd-o', ':lua require'dap'.repl.open()<CR>')

keymap.set('n', '<esc>', ':sil nohl<CR>') -- Dismiss the highlight 
keymap.set('t', '<esc>', '<C-\\><C-n>') -- Exit terminal input on ESC

-- Buffers
keymap.set({'n', 'v'}, 'Y', '\'+y') -- Copy to systemwide clipboard
keymap.set({'n', 'v'}, 'YY', '\'+yy') -- Shortcut to copy line to the systemwide clipboard
keymap.set({'n', 'v'}, 'D', '\'_d') -- Delete without copy
keymap.set({'n', 'v'}, 'DD', '\'_dd') -- Shortcut to delete line without copy


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
keymap.set('n', 'tt', ':tabnew<CR>')
keymap.set('n', 'tq', ':tabclose<CR>')
keymap.set('n', 'th', ':tabprevious<CR>')
keymap.set('n', 'tl', ':tabnext<CR>')

-- Map undo to U
keymap.set('n', 'U', '<C-r>')

-- Telescope bindings
keymap.set('n', '<C-f>', ':Telescope<CR>')
keymap.set('n', '<C-b>', ':Telescope buffers<CR>')

-- Open new window with a terminal
keymap.set('n', 'T', function()
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
keymap.set('n', 'tm', ':TableModeToggle<CR>')

-- Save all tabs and quit
keymap.set('n', 'QQ', function ()
    vim.cmd('wa')
    vim.cmd('qa')
end)
