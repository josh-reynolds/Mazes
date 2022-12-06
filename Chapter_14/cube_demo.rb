require 'cube_grid'
require 'recursive_backtracker'

grid = CubeGrid.new(10)
RecursiveBacktracker.on(grid)

middle = grid[0, grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = "cube.png"
grid.to_png.save(filename)
puts "saved to #{filename}"