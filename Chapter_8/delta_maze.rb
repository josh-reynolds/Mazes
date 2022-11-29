require 'triangle_grid'
require 'recursive_backtracker'

grid = TriangleGrid.new(10, 17)
RecursiveBacktracker.on(grid)

grid.to_png.save('delta.png')
