local Game = require('game')
local worldResolutionX = 320
local worldResolutionY = 480

local scaleX = 1
local scaleY = 1

local screenResolutionX = scaleX * worldResolutionX
local screenResolutionY = scaleY * worldResolutionY

MOAISim.openWindow("Concentration",  screenResolutionX, screenResolutionY)

local viewport = MOAIViewport.new()
viewport:setSize(screenResolutionX, screenResolutionY)
viewport:setScale(worldResolutionX, worldResolutionY)

--[[local layer = MOAILayer2D.new()
layer:setViewport(viewport)
MOAISim.pushRenderPass(layer)

local logo = MOAIGfxQuad2D.new()
logo:setTexture('assets/logo.png')
logo:setRect(-30, -30, 30, 30)

local base = MOAIProp2D.new()
base:setDeck(logo)
base:setLoc(0, 0)

layer:insertProp(base)--]]

game = Game.new()
game:initialize(viewport)
