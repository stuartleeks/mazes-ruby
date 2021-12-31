# frozen_string_literal: true

# Provides a representation of a cell in a grid
class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west

  def initialize(row, column)
    @row = row
    @column = column
    @links = {}
  end

  def link(cell, bidirectional: true)
    @links[cell] = true
    cell.link(self, bidirectional: false) if bidirectional
    self
  end

  def unlink(cell, bidirectional: true)
    @links.delete(cell)
    cell.unlink(self, bidirectional: false) if bidirectional
    self
  end

  def links
    @links.keys
  end

  def linked?(cell)
    @links.key?(cell)
  end

  def neighbours
    list = []
    list << north if north
    list << south if south
    list << east if east
    list << west if west
    list
  end
end
