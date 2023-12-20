-- Basically a library with a bunch of common functions for lua in nvim
return {
     'nvim-lua/plenary.nvim',
     dependencies = {
         'michaelb/sniprun',
         build = 'sh install.sh'
     }
 }
