require 'kruskals'
require 'weave_grid'

class SimpleOverCell < OverCell
    def neighbors
        list = []
        list << north if north
        list << south if south
        list << east if east
        list << west if west
        list
    end
end

class PreconfiguredGrid < WeaveGrid
    def prepare_grid
        Array.new(rows) do |row|
            Array.new(columns) do |column|
                SimpleOverCell.new(row, column,self)
            end
        end
    end
end

grid = PreconfiguredGrid.new(20, 20)
state = Kruskals::State.new(grid)

grid.size.times do |i|
    row = 1 + rand(grid.rows - 2)
    column = 1 + rand(grid.columns - 2)
    state.add_crossing(grid[row, column])
end

Kruskals.on(grid, state)

filename = "kruskals_weave.png"
grid.to_png(inset:0.2).save(filename)
puts "saved to #{filename}"
