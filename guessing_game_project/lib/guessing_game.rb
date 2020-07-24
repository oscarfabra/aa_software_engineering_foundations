class GuessingGame
  # Initializes the GuessingGame class
  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  # Returns @num_attempts
  def num_attempts
    @num_attempts
  end

  # Returns @game_over
  def game_over?
    @game_over
  end

  # Checks if the given number equals the secret number and prints a message
  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true
      puts "You win!"
    elsif num > @secret_num
      puts "Too big"
    else
      puts "Too small"
    end
  end

  # Asks the user for a number and proceeds acrodingly
  def ask_user
    print "Enter a number: "
    num = gets.chomp.to_i
    self.check_num(num)
  end
end
