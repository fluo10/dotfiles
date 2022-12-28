-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'skanehira/translate.vim'
    use 'dhruvasagar/vim-table-mode'
    use {
        'chrisbra/csv.vim',
        ft = 'csv'
    }
    --use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-neorg/neorg',
        ft = 'norg',
        --alter = 'nvim-treesitter',
        config = function()
            requre('neorg').setup {

            }
        end,
        requres = 'nvim-lua/plenary.nvim'
    }
end)