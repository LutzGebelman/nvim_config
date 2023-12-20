-- comment and uncomment stuff with vim motions
return {'numToStr/Comment.nvim', config = function()
    require('Comment').setup()
end}
