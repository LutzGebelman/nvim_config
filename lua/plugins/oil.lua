-- File browser
return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        require('oil').setup({
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime"
            },
            buf_options = {
                buflisted = true,
                bufhidden = "hide"
            },
            skip_confirm_for_simple_edits = true,
        })
    end
}
