require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  # Creates a new Battleship instance
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  # Randomly places ships on the @board and prints accordingly
  def start_game
    @board.place_random_ships
    puts "There are #{@board.num_ships} hidden ships on the board."
    @board.print
  end

  # Tells if the user has lost the game
  def lose?
    return false if @remaining_misses > 0
    puts "You lose"
    true
  end

  # Tells if the user has won the game
  def win?
    return false if @board.num_ships > 0
    puts "You win!"
    true
  end

  # Returns true if the game has been won or lost
  def game_over?
    self.lose? || self.win?
  end

  # Gets a move from the player and acts accordingly
  def turn
    pos = @player.get_move
    @board.attack(pos)
    @board.print
    @remaining_misses -= 1 if board[pos] == :X
    puts "#{@remaining_misses} remaining misses."
  end
end
