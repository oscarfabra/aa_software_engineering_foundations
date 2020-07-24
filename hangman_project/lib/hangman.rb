class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  # Returns a random word in the dictionary
  def self.random_word
    DICTIONARY.sample
  end

  # Creates a new Hangman instance
  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length) { |char| '_' }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  # Returns @guess_word
  def guess_word
    @guess_word
  end

  # Returns @attempted_chars
  def attempted_chars
    @attempted_chars
  end

  # Returns @remaining_incorrect_guesses
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  # Returns true if the given char is in @attempted_chars
  def already_attempted?(char)
    @attempted_chars.any? { |c| c.downcase == char.downcase }
  end

  # Returns an array containing all indices of @secret_word where the char
  # can be found
  def get_matching_indices(char)
    indices = []
    (0...@secret_word.length).each do |i|
      indices << i if @secret_word[i] == char
    end
    indices
  end

  # Sets the given indices of @guess_word to the given char
  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  # Checks the given guessed char and acts accordingly
  def try_guess(char)
    if self.already_attempted?(char)
      puts "That has already been attempted"
      false
    else
      @attempted_chars << char
      indices = self.get_matching_indices(char)
      (indices.empty?)? @remaining_incorrect_guesses -= 1 : self.fill_indices(char, indices)
      true
    end
  end

  # Asks the user for a guess and proceeds accrodingly
  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp
    self.try_guess(char)
  end

  # Checks whether the user has won or not
  def win?
    if @guess_word.join.downcase == @secret_word.downcase
      puts "YOU WIN"
      true
    else
      false
    end
  end

  # Checks whether the user has lost or not
  def lose?
    if @remaining_incorrect_guesses == 0
      puts "YOU LOSE"
      true
    else
      false
    end
  end

  # Checks whether the game has ended or not
  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      true
    else
      false
    end
  end
end
