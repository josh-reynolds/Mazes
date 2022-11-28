require 'grid'
require 'recursive_backtracker'

grid = Grid.new(5, 5)

# orphan the cell in the northwest corner...
grid[0, 0].east.west = nil
grid[0, 0].south.north = nil

# ...and the one in the southest corner
grid[4, 4].west.east = nil
grid[4, 4].north.south = nil

RecursiveBacktracker.on(grid, start_at: grid[1,1])

puts grid
