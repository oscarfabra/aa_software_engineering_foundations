class ComputerPlayer
  attr_reader :mark

  # Creates a new ComputerPlayer instance
  def initialize(mark)
    @mark = mark
  end

  # Returns a random position from the given array of positions
  def get_position(legal_positions)
    pos = legal_positions.sample
    puts "Computer #{@mark} chose the position #{pos}"
    pos
  end

end