require_relative "code"

class Mastermind
  # Creates a new Mastermind instance
  def initialize(length)
    @secret_code = Code.random(length)
  end

  # Prints the number of exact matches and near matches between @secret_code
  # and the given Code instance
  def print_matches(guess)
    puts "Exact matches: #{ @secret_code.num_exact_matches(guess) }"
    puts "Near matches: #{ @secret_code.num_near_matches(guess) }"
  end

  # Asks the user for a guess and responds accordingly
  def ask_user_for_guess
    print "Enter a code: "
    guess = Code.from_string(gets.chomp)
    self.print_matches(guess)
    @secret_code == guess
  end
end
