require 'grid'

class CylinderGrid < Grid
    def [](row, column)
        return nil unless row.between?(0, @rows - 1)
        column = column % @grid[row].count
        @grid[row][column]
    end
end