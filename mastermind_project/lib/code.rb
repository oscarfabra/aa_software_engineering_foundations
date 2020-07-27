class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  # Returns true when all chars of the array are in ::POSSIBLE_PEGS
  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  # Initializes a new Code instance
  def initialize(pegs)
    raise "Invalid pegs" if !Code.valid_pegs?(pegs)
    @pegs = pegs
    @pegs.map!(&:upcase)
  end

  # Returns a Code instance with a randomized pegs array of the given length
  def self.random(length)
    pegs = []
    length.times { pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  # Returns a Code instance with pegs colors given by the chars of the string
  def self.from_string(string)
    Code.new(string.split(""))
  end

  # Returns the element of @pegs at the given index
  def [](index)
    @pegs[index]
  end

  # Returns the length of @pegs
  def length
    @pegs.length
  end
end
