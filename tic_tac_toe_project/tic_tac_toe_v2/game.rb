require_relative 'board.rb'
require_relative 'human_player.rb'

class Game

  # Creates a new Game instance
  def initialize(p_1_mark, p_2_mark)
    @player_1 = HumanPlayer.new(p_1_mark)
    @player_2 = HumanPlayer.new(p_2_mark)
    @board = Board.new
    @current_p = @player_1
  end

  # Sets the current player to the other player
  def switch_turn
    (@current_p == @player_1)? @current_p = @player_2 : @current_p = @player_1
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