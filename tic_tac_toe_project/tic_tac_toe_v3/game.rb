require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game

  # Creates a new Game instance
  def initialize(n, hash)
    @players = []
    hash.each do |mark, computer|
      (computer)? @players << ComputerPlayer.new(mark) : @players << HumanPlayer.new(mark)
    end
    @board = Board.new(n)
    @current_p = @players[0]
  end

  # Sets the current player to the other player
  def switch_turn
    @players.rotate!
    @current_p = @players[0]
  end

  # Contains the main game loop
  def play
    win = false
    while @board.empty_positions?
      @board.print
      pos = @current_p.get_position(@board.legal_positions)
      @board.place_mark(pos, @current_p.mark)
      if @board.win?(@current_p.mark)
        puts "Player #{@current_p.mark} wins! :D"
        win = true
        break
      else
        self.switch_turn
      end
    end
    puts "Draw!" if !win
  end

end