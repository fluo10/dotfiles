local optional_modules = { "journal" }

local function is_module_available(name)
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

for key, value in pairs(optional_modules) do
  if is_module_available(value) then
    require(value)
  end
end

