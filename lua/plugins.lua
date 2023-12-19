local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("io")
local pluginlist = {}

for file in io.popen("ls $XDG_CONFIG_HOME/nvim/lua/plugins"):lines() do
    local filename = "plugins." .. string.sub(file, 1, string.find(file, ".lua", nil, true) - 1)
    local thething = require(filename)
    if type(thething) ~= "boolean" then
        table.insert(pluginlist, thething)
    end
end

require("lazy").setup(pluginlist)
