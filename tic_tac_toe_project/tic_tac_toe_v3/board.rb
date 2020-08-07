class Board

  # Creates a new Board instance
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
  end

  # Returns true if the position is not out of bounds
  def valid?(pos)
    pos[0] >= 0 && pos[1] >= 0 && pos[0] < @grid.length && pos[1] < @grid.length 
  end

  # Returns true if the specified position does not contain a player's mark
  def empty?(pos)
    @grid[pos[0]][pos[1]] == '_'
  end

  # Assigns the given mark to the specified position of the grid
  def place_mark(pos, mark)
    raise "invalid mark" if !self.valid?(pos) || !self.empty?(pos)
    @grid[pos[0]][pos[1]] = mark
  end

  # Prints out the board and all of the marks that have been placed on it
  def print
    @grid.each do |row|
      row_eles = ""
      row.each do |ele|
        row_eles += ele.to_s + "  "
      end
      puts row_eles
    end
    true
  end

  # Returns true if the given mark has completely filled up any row of the grid
  def win_row?(mark)
    @grid.each do |row|
      return true if row.all? { |ele| ele == mark }
    end
    false
  end

  # Returns true if the given mark has completely filled up any column of the
  # grid
  def win_col?(mark)
    (0...@grid[0].length).each do |col|
      win = true
      (0...@grid.length).each do |row|
        win = false if @grid[row][col] != mark
      end
      return true if win
    end
    false
  end

  # Returns true if the given mark has completely filled up either diagonal of
  # the grid
  def win_diagonal?(mark)
    win = true
    (0...@grid.length).each do |i|
      win = false if @grid[i][i] != mark
    end
    return true if win
    win = true 
    (0...@grid[0].length).each do |i|
      win = false if @grid[-1 - i][i] != mark
    end
    win
  end

  # Returns true if the given mark has filled any full row, column, or diagonal
  def win?(mark)
    self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
  end

  # Returns true if there is at least one empty position on the grid
  def empty_positions?
    @grid.each do |row|
      return true if row.any? { |ele| ele == '_' }
    end
    false
  end

  # Returns an array containing all positions that are legal to place a new
  # mark on.
  def legal_positions
    positions = []
    (0...@grid.length).each do |row|
      (0...@grid[0].length).each do |col|
        positions << [row, col] if @grid[row][col] == '_'
      end
    end
    positions
  end
end