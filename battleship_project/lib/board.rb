class Board
  attr_reader :size

  # Prints each row of @grid so every element in a row is separated with 
  # a space
  def self.print_grid(grid)
    grid.each { |row| puts row.join(" ") }
  end

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

  # Attacks a position in the @grid and acts accordingly
  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "You sunk my battleship!"
      true
    else
      self[pos] = :X
      false
    end
  end

  # Randomly sets 25% of the @grid's elements to :S
  def place_random_ships
    ships = (@size.to_f / 4).floor
    side = @grid.length
    while self.num_ships < ships
      @grid[rand(side)][rand(side)] = :S
    end
  end

  # Returns a 2D array representing the grid where every :S is replaced with
  # an :N
  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        (ele == :S)? :N : ele
      end
    end
  end

  # Calls Board::print_grid with @grid as an arg
  def cheat
    Board.print_grid(@grid)
  end

  # Calls Board::print_grid with the #hidden_ships_grid as an arg
  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
