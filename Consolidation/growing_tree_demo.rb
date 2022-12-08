require 'growing_tree'
require 'grid'

def save(grid, filename)
    grid.to_png.save(filename)
    puts "saved to #{filename}"
end

grid = Grid.new(20, 20)
GrowingTree.on(grid) { |list| list.sample }
middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances
save(grid, "growing-tree-random.png")

grid = Grid.new(20, 20)
GrowingTree.on(grid) { |list| list.last }
middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances
save(grid, "growing-tree-last.png")

grid = Grid.new(20, 20)
GrowingTree.on(grid) { |list| (rand(2) == 0) ? list.last : list.sample }
middle = grid[grid.rows / 2, grid.columns / 2]
grid.distances = middle.distances
save(grid, "growing-tree-mix.png")