class HumanPlayer
  attr_reader :mark

  # Creates a new HumanPlayer instance
  def initialize(mark)
    @mark = mark
  end

  # Allows the user to enter a valid row col position
  def get_position
    print "Player #{@mark}, enter a position in the format 'row col': "
    input = gets.chomp.split(" ")
    raise "wrong number of arguments" if input.length != 2 
    raise "arguments must be integers" if !Integer(input[0], exception: false) || !Integer(input[1], exception: false)
    [input[0].to_i, input[1].to_i]
  end
end