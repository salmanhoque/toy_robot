# Author : Md.Salman Ul Hoque <s.ulhoque@gmail.com>
# This file is used to create and control robots movement.
# Roboto Class
class Robot
  attr_accessor :x, :y, :f
  # Dimension of square table top

  # Initialize robot when placement is valid
  def initialize(x, y, f)
    @min_unit = 0
    @max_unit = 5

    if x < @min_unit || x > @max_unit || y < @min_unit || y > @max_unit
      puts 'Invalid Input'
    else
      @x = x
      @y = y
      @f = f
    end
  end

  # Logic to move robot in different directions

  public

  def move
    case @f
    when 'NORTH'
      move_north
    when 'SOUTH'
      move_south
    when 'EAST'
      move_east
    when 'WEST'
      move_west
    end
  end

  # Logic to rotate robot.

  public

  def rotate(side)
    from_north = { 'LEFT' => 'WEST', 'RIGHT' => 'EAST' }
    from_south = { 'LEFT' => 'EAST', 'RIGHT' => 'WEST' }
    from_east  = { 'LEFT' => 'NORTH', 'RIGHT' => 'SOUTH' }
    from_west  = { 'LEFT' => 'SOUTH', 'RIGHT' => 'NORTH' }
    case @f
    when 'NORTH' then @f = from_north[side]
    when 'SOUTH' then @f = from_south[side]
    when 'EAST' then @f = from_east[side]
    when 'WEST' then @f = from_west[side]
    end
  end

  # Prints out robots current position

  public

  def report
    puts 'Output: ' + @x.to_s + ',' + @y.to_s + ',' + @f
  end

  private

  def move_north
    if y >= @min_unit && y < @max_unit
      @y += 1
    else
      puts 'Can not move further NORTH'
    end
  end

  def move_south
    if y > @min_unit && y <= @max_unit
      @y -= 1
    else
      puts 'Can not move further SOUTH'
    end
  end

  def move_east
    if x >= @min_unit && x < @max_unit
      @x += 1
    else
      puts 'Can not move further EAST'
    end
  end

  def move_west
    if x > @min_unit && x <= @max_unit
      @x -= 1
    else
      puts 'Can not move further WEST'
    end
  end
end
