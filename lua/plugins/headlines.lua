-- Headlines in MD and org files
return {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() require('headlines').setup() end
}
