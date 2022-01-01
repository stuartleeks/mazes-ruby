# frozen_string_literal: true

require_relative './distances'

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

  def distances
    distances = Distances.new(self)
    frontier = [self]

    while frontier.any?
      new_frontier = []

      frontier.each do |cell|
        cell.links.each do |linked|
          next if distances[linked]

          distances[linked] = distances[cell] + 1
          new_frontier << linked
        end
      end

      frontier = new_frontier
    end

    distances
  end
end
