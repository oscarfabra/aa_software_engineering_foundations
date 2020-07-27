class Board
  attr_reader :size

  # Creates a new Board instance
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end
  
  # Returns the element of @grid at the given position
  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  # Sets the given position of @grid to the given value
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  # Returns a number representing the count of :S values in @grid
  def num_ships
    @grid.flatten.count(:S)
  end
end
