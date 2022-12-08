require 'grid3d'
require 'recursive_backtracker'

grid = Grid3D.new(3, 20, 20)
RecursiveBacktracker.on(grid)

middle = grid[grid.levels / 2, grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = '3d.png'
grid.to_png(cell_size: 20).save(filename)
puts "saved to #{filename}"