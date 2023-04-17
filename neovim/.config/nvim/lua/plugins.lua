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
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require "nvim-treesitter.configs".setup {
        highlight = {
          enable = true,
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end
  }
  use { 
    'nvim-treesitter/playground',
  }
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
          ["core.norg.concealer"] = {
            config = {
              icons = {
                todo = {
                  undone = { icon = " " }
                },
              },
            },
          },
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                journal = "~/.journal",
              },
              index = "index.norg",
              default_workspace = "journal",
            },
          },
          ["core.norg.journal"] = {
            config = {
              workspace = "journal",
              journal_folder = "logs",
              strategy = "%Y/%m/%d.norg",
            },
          },
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
  use {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v1.2.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = require'cmp'.mapping.preset.insert({
          ['<C-d>'] = require'cmp'.mapping.scroll_docs(-4),
          ['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
          ['<C-Space>'] = require'cmp'.mapping.complete(),
          ['<CR>'] = require'cmp'.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        },
      }
    end
  }
  use "ellisonleao/gruvbox.nvim"
  use "atelierbram/Base2Tone-nvim"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
