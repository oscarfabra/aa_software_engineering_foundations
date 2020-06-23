# Returns the given word with it's last vowel (a, e, i, o, u) removed
def hipsterfy(word)
  last_vowel_i = -1
  word.each_char.with_index do |char, i|
    last_vowel_i = i if "aeiou".include?(char)
  end
  return word if last_vowel_i == -1
  word[0...last_vowel_i] + word[last_vowel_i + 1..-1]
end

# Returns a hash where each key is a vowel of the given string and it's value 
# is the number of times it appears
def vowel_counts(str)
  hash = Hash.new(0)
  str.each_char do |char| 
    hash[char.downcase] += 1 if "aeiou".include?(char.downcase)
  end
  hash
end

# Returns a new string where every letter of the message is shifted n positions
# in the alphabet
def caesar_cipher(message, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_arr = message.split("").map do |char|
    if alphabet.include?(char)
      i = (alphabet.index(char) + n) % alphabet.length
      alphabet[i]
    else
      char
    end
  end
  new_arr.join
end