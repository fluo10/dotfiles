vim.g.loaded_netrw =1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

--require("init_packer")
--

vim.api.nvim_create_autocmd( { 'BufNewFile', 'BufRead', }, {
  pattern = { '*.md', '*.norg' },
  callback = function() 
    vim.opt.spell = true
    vim.opt.spelllang = { "en_us" ,"en_gb" ,"cjk" }
  end
})

require('plugins')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("nvim-web-devicons").get_icons()
require("nvim-tree").setup()


local function open_nvim_tree(data)

  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()

end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.o.exrc=true
vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
require('snippets')

function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

local external_modules = { "journal" }
for key, value in pairs(external_modules) do
  
  if isModuleAvailable(value) then
    require(value)
  end
end
