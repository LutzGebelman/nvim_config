-- Editor side bidi text (doesn't work with table mode)

return { 'mcookly/bidi.nvim',
    config = function()
        require("bidi").setup({
        })
    end
}
