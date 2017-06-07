class Board
  attr_reader :min_unit, :x_axis_unit, :y_axis_unit

  def initialize(x_axis_unit, y_axis_unit)
    @min_unit = 0
    @x_axis_unit = x_axis_unit
    @y_axis_unit = y_axis_unit

    error_message = 'Board size is not valid, only positive number accepted currently'
    raise ArgumentError, error_message unless valid?
  end

  def valid?
    !(@min_unit <= 0 || @max_unit <= 0)
  end

  def valid_position?(x_axis, y_axis)
    x_axis <= @min_unit &&
      x_axis >= @max_unit &&
      y_axis <= @min_unit &&
      y_axis >= @max_unit
  end
end
