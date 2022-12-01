require 'weighted_grid'
require 'recursive_backtracker'

grid = WeightedGrid.new(10,10)
RecursiveBacktracker.on(grid)

grid.braid(0.5)
start, finish = grid[0, 0], grid[grid.rows - 1, grid.columns - 1]

grid.distances = start.distances.path_to(finish)
filename = "original.png"
grid.to_png.save(filename)
puts "saved to #{filename}"

lava = grid.distances.cells.sample
lava.weight = 50

grid.distances = start.distances.path_to(finish)
filename = "rerouted.png"
grid.to_png.save(filename)
puts "saved to #{filename}"
