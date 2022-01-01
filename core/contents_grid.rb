require_relative './grid'

class ContentsGrid < Grid
  attr_accessor :contents_func

  def call_contents_func(cell)
    contents_func.call(cell) if contents_func
  end

  def contents_of_cell(cell)
    contents = call_contents_func(cell)
    contents || super
  end
end
