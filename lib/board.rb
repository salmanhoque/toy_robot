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
    !(@x_axis_unit <= 0 || @y_axis_unit <= 0)
  end

  def valid_position?(x_axis, y_axis)
    x_axis_valid?(x_axis) && y_axis_valid?(y_axis)
  end

  def x_axis_valid?(x_axis)
    x_axis >= @min_unit && x_axis <= @x_axis_unit
  end

  def y_axis_valid?(y_axis)
    y_axis >= @min_unit && y_axis <= @y_axis_unit
  end
end
