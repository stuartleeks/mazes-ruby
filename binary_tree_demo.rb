require 'core/grid'
require 'binary_tree'

row_count = Integer(ENV['ROWS'])
column_count = Integer(ENV['COLUMNS'])
puts "hi"
puts row_count
puts column_count
grid = Grid.new(row_count, column_count)

BinaryTree.on(grid)

puts grid
