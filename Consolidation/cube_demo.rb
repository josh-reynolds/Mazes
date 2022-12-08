require 'cube_grid'
require 'recursive_backtracker'

grid = CubeGrid.new(12)
RecursiveBacktracker.on(grid)

middle = grid[0, grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = "cube.png"
grid.to_png(cell_size: 20, inset:0.1).save(filename)
puts "saved to #{filename}"