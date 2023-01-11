-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--vim.cmd [[packadd packer.nvim]]

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
  if packer_bootstrap then
    require('packer').sync()
  end
end)
