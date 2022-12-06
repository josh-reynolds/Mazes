require 'cylinder_grid'
require 'recursive_backtracker'

grid = CylinderGrid.new(14, 32)
RecursiveBacktracker.on(grid)

middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = "cylinder.png"
grid.to_png(cell_size: 20, inset: 0.15).save(filename)
puts "saved to #{filename}"