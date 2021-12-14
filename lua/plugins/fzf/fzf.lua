-- File Containing the Plugins use to configure Fuzzy Finders
-- Author: Javier de Marco

require('packer').startup(function(use)
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
