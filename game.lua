local _M = {}

local ResourceManager = require('resource_manager')
local ResourseDefinitions = require('resource_definitions')

local resource_definitions = {
   logo = {
     type = ResourceManager.RESOURCE_TYPE_IMAGE,
     fileName = 'logo.png',
     width = 60,
     height = 60,
     }, 
  }
  
  function new()
    local game = {}
    
    local function resource_definitions_load(resources)
      for i, res in pairs(resource_definitions) do         
         ResourseDefinitions:set(i, res)
      end
    end
    
    function game:logo_load()
      self.logo = ResourceManager:get('logo')
           
      self.logo_prop = MOAIProp2D.new()
      self.logo_prop:setDeck(game.logo)
      self.logo_prop:setLoc(0, 0)
      
      self.layer:insertProp(game.logo_prop)  
    end
    
    function game:initialize(viewport)
      self.layer = MOAILayer2D.new()
      self.layer:setViewport(viewport)
      MOAISim.pushRenderPass(self.layer)
      
      resource_definitions_load(resource_definitions)
      self:logo_load()
      
    end
    
    return game
  end
  _M.new = new
  
  return _M