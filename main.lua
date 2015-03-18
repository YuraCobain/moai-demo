local Game = require('game').start()
local worldResolutionX = 320
local worldResolutionY = 480

local scaleX = 1
local scaleY = 1

local screenResolutionX = scaleX * worldResolutionX
local screenResolutionY = scaleY * worldResolutionY

RESOURCE_TYPE_IMAGE = 0
RESOURCE_TYPE_TILED_IMAGE = 1
RESOURCE_TYPE_FONT = 3
RESOURCE_TYPE_SOUND = 4

MOAISim.openWindow("Concentration",  screenResolutionX, screenResolutionY)

local viewport = MOAIViewport.new()
viewport:setSize(screenResolutionX, screenResolutionY)
viewport:setScale(worldResolutionX, worldResolutionY)

function mainLoop()
  Game.initialize(viewport)
  print('started')
end


gameThread = MOAICoroutine.new()
gameThread:run(mainLoop)