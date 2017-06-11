class Interface
  def initialize
    @action = Action.new(self)
    @user_args = nil
  end

  def launch
    help_message
    until @user_args == 'exit'
      print '> '

      @user_args = gets.chomp
      run_action
      print_error
      print_report
    end
  end

  def help_message
    puts <<~HELP
    Welcome To Toy Robot Simulator

    Robot Controls/Commands:
    board 5 7       This will generate a board with 5x and 7y unit
    place X, Y, F   This command will place the robot on a table
                    where X, Y should be in between 0 and x/y asix unit
                    and F could be north, south, east or west
    move            This command will move the robot one unit forward
    left or right   Rotate robot face left or right
    report          Print out robot's current position
    help            To see help message
    exit            Exit from this simulator
    HELP
  end

  private

  def run_action
    return if @user_args == 'exit'
    @action.input(@user_args)
  end

  def print_error
    return if @action.valid?
    puts @action.error 
  end

  def print_report
    return unless @user_args == 'report'
    puts @action.report
  end
end
