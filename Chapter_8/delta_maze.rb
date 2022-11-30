require 'triangle_grid'
require 'recursive_backtracker'

6.times do |n|
    grid = TriangleGrid.new(10, 17)
    RecursiveBacktracker.on(grid)

    middle = grid[grid.rows / 2, grid.columns / 2]
    grid.distances = middle.distances

    filename = "delta_grid_%02d.png" % n
    grid.to_png.save(filename)
    puts "saved to #{filename}"
end