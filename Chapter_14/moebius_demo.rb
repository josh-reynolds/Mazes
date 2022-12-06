require 'moebius_grid'
require 'recursive_backtracker'

grid = MoebiusGrid.new(5, 50)
RecursiveBacktracker.on(grid)

middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = "moebius.png"
grid.to_png(cell_size: 20, inset: 0.1).save(filename)
puts "saved to #{filename}"