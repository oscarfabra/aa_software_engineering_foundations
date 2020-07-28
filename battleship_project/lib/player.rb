class Player
  # Gets a position with coordinates from the user
  def get_move
    print "enter a position with coordinates separated with a space like '4 7': "
    coord = gets.chomp
    coord.split.map(&:to_i)
  end
end
