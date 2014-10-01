#Author : Md.Salman Ul Hoque <s.ulhoque@gmail.com>
#This file is used to get user input from standrd input.

require File.expand_path('lib/Robot.rb')

class Interface

  # Launches the application
  public
  def launch
    welcomeMessage

    result = nil
    until result == :quit
      action, user_args = userAction
      result = actions(action, user_args)
    end   
  end


  # Takes user input
  def userAction
    print "> " 
    user_args = gets.chomp.split(' ')
    action    = user_args.shift
    return action, user_args
  end


  # Validates and pass command to robot
  def actions(action, user_args)
    case action
    when "PLACE"
      if isPlaceInputValid(user_args)
        x,y,f = user_args.shift.split(',')
        @robot = Robot.new(x.to_i,y.to_i,f)
      else
        puts "Invalid Input"  
      end 
    when "MOVE"
      @robot.move
    when "LEFT"
      @robot.rotate(:LEFT)
    when "RIGHT"
      @robot.rotate(:RIGHT)
    when "REPORT"  
      @robot.report
    when 'QUIT'
      return :quit      
    end
  end

  def isPlaceInputValid(user_args)
    sides = ["NORTH","SOUTH","EAST","WEST"]
    
    #user_args should have 3 valid arguments.
    return false if user_args.empty?

    args = user_args[0].split(',')
    return false if not args.length == 3
    
    #The 3rd arguments is, the side robot is facing
    return false if not sides.include? args[2] 
    return true
  end


  #Welcome message and list of valid commands.
  def welcomeMessage
    print "\nWelcome To Toy Robot Simulator\n"
    print "\nRobot Controls/Commands: \n"
    
    print "PLACE X,Y,F ".ljust(15)  
    print " This command will place the robot on a table\n" \
        + "\t\twhere X,Y should be in between 0 and 5 and F could be\n" \
        + "\t\tNORTH,SOUTH,EAST or WEST.\n"
    
    print "MOVE ".ljust(15)   
    print " This command will move the robot one unit forward.\n"

    print "LEFT or RIGHT ".ljust(15)   
    print " Rotate robot face left or right.\n"

    print "REPORT ".ljust(15)   
    print " Print out robot's current position.\n"

    print "QUIT ".ljust(15)   
    print " Exit from this simulator.\n\n\n"    
  end

end