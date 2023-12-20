-- Highliting and telescope integrations for TODO ERR WARN etc.
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require('todo-comments').setup() end
}
