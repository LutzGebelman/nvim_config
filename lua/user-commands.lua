vim.api.nvim_create_user_command('Shortcut', function()
    vim.fn.feedkeys(':w\r')
    vim.fn.feedkeys(':source\r')
    vim.fn.feedkeys(':TableFormat\r')
end, {})

local function print_table(table)
    for k, p in pairs(table) do
        print(k, p)
    end
end

vim.api.nvim_create_user_command('TableFormat', function()
    local prblm_string = "  ָא   "
    local result = vim.fn.call("tablemode#utils#strip", {prblm_string})
    print(result)
    -- print(string.sub(prblm_string, result[2], result[3]))
end, {})
