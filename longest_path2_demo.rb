require 'core/contents_grid'
require 'sidewinder'

row_count = Integer(ENV['ROWS'])
column_count = Integer(ENV['COLUMNS'])
grid = ContentsGrid.new(row_count, column_count)
grid.contents_func = lambda { |cell|
  if @distances && @distances[cell]
    @distances[cell].to_s(36)
  else
    ' '
  end
}

Sidewinder.on(grid)
# puts grid
# puts ''

start = grid[0, 0]
@distances = start.distances
# puts grid
# puts ''

new_start, = start.distances.max
@distances = start.distances.path_to(new_start)
# puts grid
# puts ''

@distances = new_start.distances
# puts grid
# puts ''

endpoint, = new_start.distances.max
@distances = new_start.distances.path_to(endpoint)
# puts grid
# puts ''

grid.contents_func = lambda { |cell|
  if cell == endpoint
    'S'
  elsif cell == new_start
    'E'
  else
    ' '
  end
}
puts grid
puts ''

img = grid.to_png(cell_size: 32)
img.save 'maze.png'
