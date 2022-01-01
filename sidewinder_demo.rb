require 'core/grid'
require 'sidewinder'

row_count = Integer(ENV['ROWS'])
column_count = Integer(ENV['COLUMNS'])
grid = Grid.new(row_count, column_count)

Sidewinder.on(grid)

puts grid

img = grid.to_png
img.save 'maze.png'
