require 'grid3d'

class Cell4D < Cell3D
    attr_reader :world
    attr_accessor :hither, :yon

    def initialize(world, level, row, column)
        @world = world
        super(level, row, column)
    end

    def neighbors
        list = super
        list << hither if hither
        list << yon if yon
        list
    end
end

class Grid4D < Grid3D
    attr_reader :worlds

    def initialize(worlds, levels, rows, columns)
        @worlds = worlds
        super(levels, rows, columns)
    end

    def prepare_grid
        Array.new(worlds) do |world|
            Array.new(levels) do |level|
                Array.new(rows) do |row|
                    Array.new(columns) do |column|
                        Cell4D.new(world, level, row, column)
                    end
                end
            end
        end
    end

    def configure_cells
        each_cell do |cell|
            world, level, row, col = cell.world, cell.level, cell.row, cell.column

            cell.north  = self[world, level, row - 1, col]
            cell.south  = self[world, level, row + 1, col]
            cell.west   = self[world, level, row, col - 1]
            cell.east   = self[world, level, row, col + 1]
            cell.down   = self[world, level - 1, row, col]
            cell.up     = self[world, level + 1, row, col]
            cell.hither = self[world - 1, level, row, col]
            cell.yon    = self[world + 1, level, row, col]
        end
    end

    def [](world, level, row, column)
        return nil unless world.between?(0, @worlds - 1)
        return nil unless level.between?(0, @grid[world].count - 1)
        return nil unless row.between?(0, @grid[world][level].count - 1)
        return nil unless column.between?(0, @grid[world][level][row].count - 1)
        @grid[world][level][row][column]
    end

    def random_cell
        world  = rand(@worlds)
        level  = rand(@grid[world].count)
        row    = rand(@grid[world][level].count)
        column = rand(@grid[world][level][row].count)

        @grid[world][level][row][column]
    end

    def size
        @worlds * @levels * @rows * @columns
    end

    def each_world
        @grid.each do |world|
            yield world
        end
    end

    def each_level
        each_world do |levels|
            levels.each do |level|
                yield level
            end
        end
    end

    def to_png(cell_size: 10, inset: 0, margin: cell_size/2)
        inset = (cell_size * inset).to_i

        grid_width = cell_size * columns
        grid_height = cell_size * rows

        img_width = grid_width * levels + (levels - 1) * margin
        img_height = grid_height * worlds + (worlds - 1) * margin

        background = ChunkyPNG::Color::WHITE
        wall = ChunkyPNG::Color::BLACK
        arrow = ChunkyPNG::Color.rgb(255, 0, 0)

        img = ChunkyPNG::Image.new(img_width + 1, img_height + 1, background)

        [:backgrounds, :walls].each do |mode|
            each_cell do |cell|
                x = cell.level * (grid_width + margin) + cell.column * cell_size
                y = cell.world * (grid_height + margin) + cell.row * cell_size

                if inset > 0
                    to_png_with_inset(img, cell, mode, cell_size, wall, x, y, inset)
                else
                    to_png_without_inset(img, cell, mode, cell_size, wall, x, y)
                end

                if mode == :walls
                    mid_x = x + cell_size / 2
                    mid_y = y + cell_size / 2

                    if cell.linked?(cell.down)
                        img.line(mid_x - 3, mid_y, mid_x - 1, mid_y + 2, arrow)
                        img.line(mid_x - 3, mid_y, mid_x - 1, mid_y - 2, arrow)
                    end

                    if cell.linked?(cell.up)
                        img.line(mid_x + 3, mid_y, mid_x + 1, mid_y + 2, arrow)
                        img.line(mid_x + 3, mid_y, mid_x + 1, mid_y - 2, arrow)
                    end

                    if cell.linked?(cell.hither)
                        img.line(mid_x, mid_y - 3, mid_x + 2, mid_y - 1, arrow)
                        img.line(mid_x, mid_y - 3, mid_x - 2, mid_y - 1, arrow)
                    end

                    if cell.linked?(cell.yon)
                        img.line(mid_x, mid_y + 3, mid_x + 2, mid_y + 1, arrow)
                        img.line(mid_x, mid_y + 3, mid_x - 2, mid_y + 1, arrow)
                    end
                end
            end
        end

        img
    end
end