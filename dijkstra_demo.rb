require 'core/distance_grid'
require 'sidewinder'

row_count = Integer(ENV['ROWS'])
column_count = Integer(ENV['COLUMNS'])
grid = DistanceGrid.new(row_count, column_count)

Sidewinder.on(grid)

puts grid
puts ''

start = grid[0, 0]
grid.distances = start.distances

puts grid
puts ''

grid.distances = start.distances.path_to(grid[grid.row_count - 1, 0])

puts grid
puts ''
