require 'polar_grid'
require 'recursive_backtracker'

6.times do |n|
    grid = PolarGrid.new(8)
    RecursiveBacktracker.on(grid)

    middle = grid[0, 0]
    grid.distances = middle.distances

    filename = "circle_maze_%02d.png" % n
    grid.to_png.save(filename)
    puts "saved to #{filename}"
end