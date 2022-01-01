require_relative './grid'

class DistanceGrid < Grid
  attr_accessor :distances

  def contents_of_cell(cell)
    if distances && distances[cell]
      distances[cell].to_s(36)
    else
      super
    end
  end
end
