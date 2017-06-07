require 'pry'

class Robot
  def initialize(board, x_axis, y_axis, facing)
    @board = board
    @x_axis = x_axis
    @y_axis = y_axis
    @facing = facing
  end

  def move
    case @facing
    when 'north'
      move_north
    when 'south'
      move_south
    when 'east'
      move_east
    when 'west'
      move_west
    end
  end

  def rotate(side)
    from_north = { 'left' => 'west', 'right' => 'east' }
    from_south = { 'left' => 'east', 'right' => 'west' }
    from_east  = { 'left' => 'north', 'right' => 'south' }
    from_west  = { 'left' => 'south', 'right' => 'north' }
    case @facing
    when 'north' then @facing = from_north[side]
    when 'south' then @facing = from_south[side]
    when 'east' then @facing = from_east[side]
    when 'west' then @facing = from_west[side]
    end
  end

  def report
    "Current Position: #{@x_axis}, #{@y_axis}, #{@facing.upcase}"
  end

  private

  def move_north
    if @y_axis >= @min_unit && @y_axis < @max_unit
      @y_axis += 1
    else
      'Can not move further NORTH'
    end
  end

  def move_south
    if @y_axis > @min_unit && @y_axis <= @max_unit
      @y_axis -= 1
    else
      'Can not move further SOUTH'
    end
  end

  def move_east
    if @x_axis >= @min_unit && @x_axis < @max_unit
      @x_axis += 1
    else
      'Can not move further EAST'
    end
  end

  def move_west
    if @x_axis > @min_unit && @x_axis <= @max_unit
      @x_axis -= 1
    else
      'Can not move further WEST'
    end
  end
end
