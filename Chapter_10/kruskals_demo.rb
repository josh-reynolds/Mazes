require 'kruskals'
require 'grid'

grid = Grid.new(20, 20)
Kruskals.on(grid)

filename = "kruskals.png"
grid.to_png.save(filename)
puts "saved to #{filename}"

