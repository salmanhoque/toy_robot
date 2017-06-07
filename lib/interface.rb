# Author : Md.Salman Ul Hoque <s.ulhoque@gmail.com>
# This file is used to get user input from standrd input.
require File.expand_path('lib/robot.rb')
require 'pry'

# User Interface
class Interface
  def launch
    welcome_message

    result = nil
    until result == :quit
      action, user_args = user_action
      result = actions(action, user_args)
    end
  end

  # Takes user input
  def user_action
    print '> '
    user_args = gets.chomp.split(' ')
    action    = user_args.shift
    [action, user_args]
  end

  # Validates and pass command to robot
  def actions(action, user_args)
    case action
    when 'PLACE' then place_robot(user_args)
    when 'MOVE' then @robot.move
    when 'LEFT', 'RIGHT' then @robot.rotate(action)
    when 'REPORT' then @robot.report
    when 'QUIT' then return :quit
    end
  end

  def place_robot(user_args)
    if place_input_valid?(user_args)
      initialize_robot(user_args)
    else
      puts 'Invalid Input'
    end
  end

  def place_input_valid?(user_args)
    sides = %w(NORTH SOUTH EAST WEST)
    # user_args should have 3 valid arguments.
    return false if user_args.empty?
    args = user_args[0].split(',')
    return false unless args.length == 3
    # The 3rd arguments is, the side robot is facing
    return false unless sides.include? args[2]
    true
  end

  def initialize_robot(user_args)
    x, y, f = user_args.shift.split(',')
    @robot = Robot.new(x.to_i, y.to_i, f)
  end

  # Welcome message and list of valid commands.
  def welcome_message
    print "\nWelcome To Toy Robot Simulator\n"
    print "\nRobot Controls/Commands: \n"
    place_cmd_msg
    move_cmd_msg
    report_cmd_msg
    print 'QUIT '.ljust(15)
    print " Exit from this simulator.\n\n\n"
  end

  def place_cmd_msg
    print 'PLACE X,Y,F '.ljust(15)
    print " This command will place the robot on a table\n" \
        + "\t\twhere X,Y should be in between 0 and 5 and F could be\n" \
        + "\t\tNORTH,SOUTH,EAST or WEST.\n"
  end

  def move_cmd_msg
    print 'MOVE '.ljust(15)
    print " This command will move the robot one unit forward.\n"
    print 'LEFT or RIGHT '.ljust(15)
    print " Rotate robot face left or right.\n"
  end

  def report_cmd_msg
    print 'REPORT '.ljust(15)
    print " Print out robot's current position.\n"
  end
end
