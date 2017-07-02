require File.expand_path('lib/robot.rb')
require 'pry'

class Interface
  def launch
    welcome_message

    result = nil
    until result == :exit
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
    when 'exit' then return :exit
    when 'help' then welcome_message
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

  def welcome_message
    puts <<~HELP
    Welcome To Toy Robot Simulator

    Robot Controls/Commands:

    place X,Y,F     This command will place the robot on a table
                    where X,Y should be in between 0 and 5 and F could be
                    NORTH, SOUTH, EAST or WEST
    move            This command will move the robot one unit forward
    left or right   Rotate robot face left or right
    report          Print out robot's current position
    help            To see help message
    quit            Exit from this simulator
    HELP
  end
end
