#Author : Md.Salman Ul Hoque <s.ulhoque@gmail.com>
#This file is used to create and control robots movement.

class Robot

  attr_accessor :x,:y,:f
  
  #Dimension of square table top
  private
  @@minUnit = 0
  @@maxUnit = 5 


  #Initialize robot when placement is valid
  def initialize(x,y,f)
    if(x < @@minUnit || x > @@maxUnit || y < @@minUnit || y > @@maxUnit)
      puts "Invalid Input"
    else
      @x = x
      @y = y 
      @f = f
    end
  end


  #Logic to move robot in different directions
  public
  def move
    case @f
    when "NORTH"
      if (y >= @@minUnit && y < @@maxUnit)
        @y += 1
      else
        puts "Can not move further NORTH"
      end
    when "SOUTH"
      if (y > @@minUnit && y <= @@maxUnit)
        @y -= 1
      else
        puts "Can not move further SOUTH"
      end 
    when "EAST"
      if (x >= @@minUnit && x < @@maxUnit)
        @x += 1
      else
        puts "Can not move further EAST"
      end
    when "WEST"
      if (x > @@minUnit && x <= @@maxUnit)
        @x -= 1
      else
        puts "Can not move further WEST"
      end
    end
  end


  #Logic to rotate robot.
  public 
  def rotate(side)
    
    fromNorth = {:LEFT=>"WEST",:RIGHT=>"EAST"}
    fromSouth = {:LEFT=>"EAST",:RIGHT=>"WEST"}
    fromEast  = {:LEFT=>"NORTH",:RIGHT=>"SOUTH"}
    fromWest  = {:LEFT=>"SOUTH",:RIGHT=>"NORTH"}

    case @f
    when "NORTH"
      @f = fromNorth[side]
    when "SOUTH"
      @f = fromSouth[side]
    when "EAST"
      @f = fromEast[side]
    when "WEST"
      @f = fromWest[side] 
    end
  end


  #Prints out robots current position
  public
  def report
    puts "Output: " + @x.to_s + "," + @y.to_s + "," + @f
  end

end