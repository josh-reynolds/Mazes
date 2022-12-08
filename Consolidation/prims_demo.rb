require 'prims'
require 'grid'

grid = Grid.new(20, 20)
#SimplifiedPrims.on(grid)
TruePrim.on(grid)

middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances

#filename = "prims-simple.png"
filename = "prims-true.png"
grid.to_png.save(filename)
puts "saved to #{filename}"