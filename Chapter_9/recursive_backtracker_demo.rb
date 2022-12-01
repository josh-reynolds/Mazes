require 'recursive_backtracker'
require 'grid'

grid = Grid.new(20, 20)
RecursiveBacktracker.on(grid)
grid.braid(0.5)

filename = "recursive_backtracker.png"
grid.to_png(inset: 0.1).save(filename)
puts "saved to #{filename}"