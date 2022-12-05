require 'ellers'
require 'grid'

grid = Grid.new(20, 20)
Ellers.on(grid)

middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

filename = 'ellers.png'
grid.to_png.save(filename)
puts "saved to #{filename}"