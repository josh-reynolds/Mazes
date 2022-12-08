require 'grid'
require 'binary_tree'

grid = Grid.new(6, 6)
BinaryTree.on(grid)

puts grid

img = grid.to_png
img.save "binary_tree_maze.png"