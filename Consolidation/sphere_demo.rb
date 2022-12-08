require 'sphere_grid'
require 'recursive_backtracker'

grid = SphereGrid.new(20)
RecursiveBacktracker.on(grid)

#middle = grid[0, grid.rows / 2, grid.columns / 2]
#grid.distances = middle.distances

filename = "sphere-map.png"
grid.to_png.save(filename)
puts "saved to #{filename}"