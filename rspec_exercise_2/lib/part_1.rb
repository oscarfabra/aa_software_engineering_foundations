# Returns a 2D array of length 2 where the first subarray contains elements 
# less than p and the second subarray contains elements greater than or equal
# to p
def partition(arr, p)
  sub_arr_1 = []
  sub_arr_2 = []
  arr.each do |n|
    (n < p) ? sub_arr_1 << n : sub_arr_2 << n
  end
  [sub_arr_1, sub_arr_2]
end

# Merges two hashes
def merge(hash_1, hash_2)
  new_hash = {}
  hash_1.each { |k, v| new_hash[k] = v }
  hash_2.each { |k, v| new_hash[k] = v }
  new_hash
end

# Returns the given sentence with every curse word's vowels replaced with '*'
def censor(sentence, words)
  new_sentence = sentence.split(" ").map do |word|
    if words.include?(word.downcase)
      replace_vowels(word)
    else
      word
    end
  end
  new_sentence.join(" ")
end

# Replaces each vowel of the given word with '*'
def replace_vowels(word)
  new_word = word.split("").map do |char|
    if "aeiou".include?(char.downcase)
      '*'
    else
      char
    end
  end
  new_word.join
end

# Returns true when the given number is a power of two; false otherwise
def power_of_two?(n)
  pow = 1
  while pow <= n 
    return true if pow == n
    pow *= 2
  end
  false
end