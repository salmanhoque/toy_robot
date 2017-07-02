class Robot
  # Clockwise direction
  DIRECTIONS = %w{north east south west}.freeze

  def initialize(board, x_axis, y_axis, facing)
    unless DIRECTIONS.include?(facing)
      raise ArgumentError, 'Okay: valid directions are NORTH, EAST, SOUTH and WEST!'
    end

    @board = board
    @x_axis = x_axis
    @y_axis = y_axis
    @facing = facing
  end

  def move
    validate_move

    # move 1 unit at a time.
    case @facing
    when 'north' then @y_axis += 1
    when 'south' then @y_axis -= 1
    when 'east' then @x_axis += 1
    when 'west' then @x_axis -= 1
    end
  end

  def rotate_left
    @facing = DIRECTIONS[DIRECTIONS.index(@facing) - 1]
  end

  def rotate_right
    @facing = DIRECTIONS[(DIRECTIONS.index(@facing) + 1) % 4]
  end

  def report
    "Current Position: #{@x_axis}, #{@y_axis}, #{@facing.upcase}"
  end

  private

  def validate_move
    return if validation_conditions
    raise InvalidMoveError, "Can not move further #{@facing.upcase}"
  end

  def validation_conditions
    case @facing
    when 'north' then @y_axis < @board.y_axis_unit
    when 'south' then @y_axis > @board.min_unit
    when 'east' then @x_axis < @board.x_axis_unit
    when 'west' then @x_axis > @board.min_unit
    end
  end
end
