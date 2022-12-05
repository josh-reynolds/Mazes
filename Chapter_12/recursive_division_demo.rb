require 'recursive_division'
require 'grid'

grid = Grid.new(20, 20)
RecursiveDivision.on(grid)

middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = "recursive_division.png"
grid.to_png.save(filename)
puts "saved to #{filename}"