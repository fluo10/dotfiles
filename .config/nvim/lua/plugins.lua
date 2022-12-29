-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'skanehira/translate.vim'
    use 'dhruvasagar/vim-table-mode'
    use {
        'chrisbra/csv.vim',
        ft = 'csv'
    }
    --use "nvim-lua/plenary.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        "nvim-neorg/neorg",
        ft = "norg",
        cmd = "Neorg",
        --priority = 30,
        after = 'nvim-treesitter',
        run = ":Neorg sync-parsers",
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.concealer"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                          workspaces = {
                            root = "~/Documents/journal",
                            workspace = "~/Documents/journal/workspace",
                          },
                          index = "index.norg",
                          default_workspace = "workspace",
                        },
                    },
                    --["core.norg.journal"] = {
                    --  config = {
                    --    workspace = "workspace"
                    --  },
                    --},
                }
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      --tag= "nightly",
    }
end)
