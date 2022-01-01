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

new_start, = start.distances.max
grid.distances = start.distances.path_to(new_start)
puts grid
puts ''

grid.distances = new_start.distances
puts grid
puts ''

endpoint, = new_start.distances.max
grid.distances = new_start.distances.path_to(endpoint)
puts grid
puts ''
