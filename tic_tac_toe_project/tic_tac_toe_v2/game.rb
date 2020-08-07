require_relative 'board.rb'
require_relative 'human_player.rb'

class Game

  # Creates a new Game instance
  def initialize(n, *marks)
    raise "marks should be unique" if marks != marks.uniq
    @players = []
    marks.each { |mark| @players << HumanPlayer.new(mark) }
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
    while @board.empty_positions?
      @board.print
      pos = @current_p.get_position
      @board.place_mark(pos, @current_p.mark)
      if @board.win?(@current_p.mark)
        puts "Player #{@current_p.mark} wins! :D"
        break
      else
        self.switch_turn
      end
    end
    puts "Draw!" if !@board.empty_positions?
  end

end