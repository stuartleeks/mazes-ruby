require_relative './cell'
require 'chunky_png'

# Provides a grid of cells
class Grid
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count)
    @row_count = row_count
    @column_count = column_count

    @grid = prepare_grid
    configure_cells
  end

  def prepare_grid
    Array.new(row_count) do |row|
      Array.new(column_count) do |column|
        Cell.new(row, column)
      end
    end
  end

  def configure_cells
    each_cell do |cell|
      row = cell.row
      column = cell.column

      cell.north = self[row - 1, column]
      cell.south = self[row + 1, column]
      cell.west = self[row, column - 1]
      cell.east = self[row, column + 1]
    end
  end

  def [](row, column)
    return nil unless row.between?(0, @row_count - 1)
    return nil unless column.between?(0, @column_count - 1)

    @grid[row][column]
  end

  def random_cell
    row = rand(@row_count)
    column = rand(@column_count)

    self[row, column]
  end

  def size
    @row_count * @column_count
  end

  def each_row(&block)
    @grid.each(&block)
  end

  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell if cell
      end
    end
  end

  def to_s
    output = '+' + '---+' * column_count + "\n"

    each_row do |row|
      top = '|'
      bottom = '+'

      row.each do |cell|
        cell ||= Cell.new(-1, -1)

        body = '   '
        east_boundary = (cell.linked?(cell.east) ? ' ' : '|')
        top << body << east_boundary

        south_boundary = (cell.linked?(cell.south) ? '   ' : '---')
        bottom << south_boundary << '+'
      end

      output << top << "\n"
      output << bottom << "\n"
    end
    output
  end

  def to_png(cell_size: 10)
    img_width = cell_size * column_count + 1
    img_height = cell_size * row_count + 1

    background = ChunkyPNG::Color::WHITE
    wall = ChunkyPNG::Color::BLACK

    img = ChunkyPNG::Image.new(img_width, img_height, background)

    each_cell do |cell|
      x1 = cell.column * cell_size
      y1 = cell.row * cell_size
      x2 = (cell.column + 1) * cell_size
      y2 = (cell.row + 1) * cell_size

      img.line(x1, y1, x2, y1, wall) unless cell.north
      img.line(x1, y1, x1, y2, wall) unless cell.west

      img.line(x2, y1, x2, y2, wall) unless cell.linked?(cell.east)
      img.line(x1, y2, x2, y2, wall) unless cell.linked?(cell.south)
    end

    img
  end
end
