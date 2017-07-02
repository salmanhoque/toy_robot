class Action
  ACTIONS = %w{board place move left right report help}.freeze

  def initialize(interface = nil)
    @interface = interface
    @error = nil
    @board = nil
  end

  def input(user_input)
    parse_user_input(user_input)
    validate_actions
    make_decision
    self
  end

  def error
    return if valid?

    # Once error message is displaed clean error so
    # it can display current possible again.
    report_error = @error
    @error = nil

    report_error
  end

  def report
    @robot.report
  end

  def valid?
    @error.nil?
  end

  private

  def parse_user_input(user_input)
    args = user_input.downcase.split(' ')
    @action, x_axis, y_axis, @facing = args

    @x_axis = x_axis.to_i
    @y_axis = y_axis.to_i
  end

  def make_decision
    case @action
    when 'board' then make_board
    when 'place' then place_robot
    when 'move' then move_robot
    when 'left' then @robot.rotate_left
    when 'right' then @robot.rotate_right
    when 'report' then report
    when 'help' then help_message
    end
  end

  def make_board
    @board = Board.new(@x_axis, @y_axis)
  rescue ArgumentError => e
    @error = e.message
  end

  def help_message
    error_message = 'Connected services should implement this method'
    raise NotImplementedError, error_message unless @interface.respond_to?(:help_message)

    @interface.help_message
  end

  def place_robot
    @board ||= Board.new(5, 5)
    validate_position
    @robot = Robot.new(@board, @x_axis, @y_axis, @facing)
  rescue ArgumentError => e
    @error = e.message
  end

  def move_robot
    @robot.move
  rescue InvalidMoveError => e
    @error = e.message
  end

  def validate_actions
    return if ACTIONS.include?(@action)
    @error = "Nope: can't do that, try 'help' for docs!"
  end

  def validate_position
    return if @board.nil? || @board.valid_position?(@x_axis, @y_axis)
    @error = 'Woops: you just drop that robot from the table!'
  end
end
