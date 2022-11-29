require 'hex_grid'
require 'recursive_backtracker'

grid = HexGrid.new(10, 10)
RecursiveBacktracker.on(grid)

grid.to_png.save('hex.png')