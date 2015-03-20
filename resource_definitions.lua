local _M = {}

local definitions = {}

function _M:set(name, definition)
  definitions[name] = definition
end

function _M:get(name)
  return definitions[name]
end

function _M:remove(name)
  definitions[name] = nil
end

return _M