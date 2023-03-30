local ls = require'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require'luasnip.util.events'
local ai = require'luasnip.nodes.absolute_indexer'

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/luasnippets"})

-- function exists(name)
--     if type(name)~="string" then return false end
--     return os.rename(name,name) and true or false
-- end
-- 
-- local neorg_snippets_path = "/home/fluo10/Documents/planner/.luasnippets"
-- if exists(neorg_snippets_path) then 
--      require("luasnip.loaders.from_lua").load({paths = neorg_snippets_path})
-- end
