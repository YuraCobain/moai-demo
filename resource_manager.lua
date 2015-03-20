local _M = {}
local ResourseDefinitions = require('resource_definitions')

_M.RESOURCE_TYPE_IMAGE = 0
_M.RESOURCE_TYPE_TILED_IMAGE = 1
_M.RESOURCE_TYPE_FONT = 3
_M.RESOURCE_TYPE_SOUND = 4

ASSETS_PATH = 'assets/'

local cache = {}

function _M:get(name)
  if not self:loaded(name) then
    self:load(name)
  end
  return cache[name]
end

function _M:loaded(name)
  return cache[name] ~= nil  
end

function _M:loadImage(definition)
  local image
  local filePath = ASSETS_PATH .. definition.fileName
  
  local halfWidth = definition.width / 2
  local halfHeight = definition.height / 2
  
  image = MOAIGfxQuad2D.new()
  image:setTexture(filePath)
  image:setRect(-halfWidth, -halfHeight, halfWidth, halfHeight)
  
  return image
end

function _M:loadTiledImage(definition)
  local tiledImage = MOAITileDeck2D.new()
  local filePath = ASSETS_PATH .. definition.fileName
   
  tiledImage:setTexture(filePath)
  tiledImage:setSize(unpack(definition.tileMapSize))
   
  return tiledImage
end

function _M:loadFont(definition)
  local font = MOAIFont.new()
  local filePath = ASSETS_PATH .. definition.fileName
  
  font:loadFromTTF(filePath, definition.glyphs, definition.fontSize,
    definition.dpi)
  
  return font
end

function _M:loadSound(definition)
  local sound = MOAIUntzSound.new()
  local filePath = ASSETS_PATH .. definition.fileName
  
  sound:load(filePath)
  sound:setVolume(definition.volume)
  sound:setLooping(definition.loop)
  
  return sound
end

function _M:load(name)
  local resourceDefinition = ResourseDefinitions:get(name)
  
  if not resourceDefinition then
    print("ERROR: Missing resource definition for " .. name)
  else
    local resource
    
    if resourceDefinition.type == _M.RESOURCE_TYPE_IMAGE then
      resource = self:loadImage(resourceDefinition)
    elseif resourceDefinition.type == _M.RESOURCE_TYPE_TILED_IMAGE then
      resource = self:loadTiledImage(resourceDefinition)
    elseif resourceDefinition == _M.RESOURCE_TYPE_FONT then
      resource = self:loadFont(resourceDefinition)
    elseif resourceDefinition == _M.RESOURCE_TYPE_SOUND then
      resource = self:loadSound(resourceDefinition)
    end 
    
    cache[name] = resource
  end
end  
  
return _M
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    