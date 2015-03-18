local _M = {}

GRID_COLS = 5
GRID_ROWS = 4
GRID_TILE_WIDTH = 62
GRID_TILE_HEIGHT = 62
BACK_TILE = 1

local resource_definitions = {
  
  tiles = {
      type = RESOURCE_TYPE_TILED_IMAGE,
      fileName = 'tiles.png',
      tileMapSize = {6, 2},
    },
  }
  
  function initializeTiles()
    local grid = MOAIGrid.new()
    
    grid:setSize(GRID_COLS, GRID_ROWS, GRID_TILE_WIDTH, GRID_TILE_HEIGHT)
    
    local back_tile = { BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE}
    grid:setRow(1, unpack(back_tile))
    grid:setRow(2, unpack(back_tile))
    grid:setRow(3, unpack(back_tile))
    grid:setRow(4, unpack(back_tile))
    
    self.tiles = {}
    self.tiles.grid = grid
    self.tiles.tileset = ResourseManager:get('tiles')
    
    self.prop = MOAIProp2D.new()
    self.prop:setDeck(self.tiles.tileset)
    self.prop:setGrid(self.tiles.grid)
    
    self.tiles.prop:setLoc(-GRID_COLS/2 * GRID_TILE_WIDTH,
      -GRID_ROWS/2 * GRID_TILE_HEIGHT)
    self.layer:insertProp(self.tiles.prop)
  end
  
  function initialize()
    self.layer = MOAILayer2D.new()
    self.layer:setViewport(viewport)
    
    MOAIRenderMgr:setRenderTable({self.layer})
    ResourseDefinition:setDefinitions(resource_definitions)
    
    self:initializeTiles()
  end
  
  function start()
    local self = {}
    
    local function initializeTiles()
      local grid = MOAIGrid.new()
    
      grid:setSize(GRID_COLS, GRID_ROWS, GRID_TILE_WIDTH, GRID_TILE_HEIGHT)
    
      local back_tile = { BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE, BACK_TILE}
      grid:setRow(1, unpack(back_tile))
      grid:setRow(2, unpack(back_tile))
      grid:setRow(3, unpack(back_tile))
      grid:setRow(4, unpack(back_tile))
    
      self.tiles = {}
      self.tiles.grid = grid
      self.tiles.tileset = ResourseManager:get('tiles')
    
      self.prop = MOAIProp2D.new()
      self.prop:setDeck(self.tiles.tileset)
      self.prop:setGrid(self.tiles.grid)
    
      self.tiles.prop:setLoc(-GRID_COLS/2 * GRID_TILE_WIDTH,
        -GRID_ROWS/2 * GRID_TILE_HEIGHT)
      self.layer:insertProp(self.tiles.prop)
    end
    
    self.initialize = function(viewport)
      self.layer = MOAILayer2D.new()
      self.layer:setViewport(viewport)
    
      MOAIRenderMgr:setRenderTable({self.layer})
      ResourseDefinition:setDefinitions(resource_definitions)
    
      initializeTiles()
    end
    
    return self
  end
  _M.start = start
  
  return _M