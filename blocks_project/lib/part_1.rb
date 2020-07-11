# Returns and array containing only the even numbers
def select_even_nums(arr)
  arr.select(&:even?)
end

# Returns an array containing the dogs that are older than 2 years
def reject_puppies(dogs)
  dogs.reject { |dog| dog["age"] <= 2 }
end

# Returns the number of subarrays whose elements sum to a positive quantity
def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum > 0 }
end

# Transforms the given word by putting a 'b' after every vowel and adding that
# same vowel
def aba_translate(word)
  new_word = ""
  word.each_char do |char|
    ("aeiou".include?(char))? new_word += char + 'b' + char : new_word += char
  end
  new_word
end

# Returns a new array where every word has been 'aba translated'
def aba_array(words)
  words.map { |word| aba_translate(word) }
end