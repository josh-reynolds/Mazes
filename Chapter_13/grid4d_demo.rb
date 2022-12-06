require 'grid4d'
require 'recursive_backtracker'

grid = Grid4D.new(3, 3, 11, 11)
RecursiveBacktracker.on(grid)

middle = grid[grid.worlds / 2, grid.levels / 2, grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = '4d.png'
grid.to_png(cell_size: 20).save(filename)
puts "saved to #{filename}"