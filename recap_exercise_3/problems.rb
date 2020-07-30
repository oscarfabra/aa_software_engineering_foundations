# Returns a new array containing the elements that were not repeated in arr
def no_dupes?(arr)

end

# Returns true if an element never appears consecutively in the array
def no_consecutive_repeats?(arr)

end

# Returns a hash containing characters as keys. The value for each key is an
# array containing the indices where that character is found
def char_indices(str)

end

# Returns the longest streak of consecutive characters in the string. If there
# are any ties, returns the streak that occurs later in the string.
def longest_streak(str)

end

# Returns a boolean indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying 
# two prime numbers.
# For Example:
# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24
def bi_prime?(num)

end

# A Caesar cipher takes a word and encrypts it by offsetting each letter in the
# word by a fixed number, called the key. Given a key of 3, for example: 
# a -> d, p -> s, and y -> b.
#
# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence 
# of keys is used. For example, if we encrypt "bananasinpajamas" with the key 
# sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":
# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
#
# Accepts a string and a key-sequence as args, and returns the encrypted message. 
# Assumes that the message consists of only lowercase alphabetic characters.
def vigenere_cipher(message, keys)

end

# Returns the string where every vowel is replaced with the vowel the appears 
# before it sequentially in the original string. The first vowel of the string 
# should be replaced with the last vowel.
def vowel_rotate(str)

end

class String
  # Returns a new string containing characters of the original string that return
  # true when passed into the block. If no block is passed, then it returns the
  # empty string. Must not use Array#select.
  def select(&prc)

  end

  # Modifies the existing string by replacing every character with the result of 
  # calling the block, passing in the original character and its index.  Must not
  # use Array#map or Array#map!.
  def map!(&prc)

  end
end

# Returns the product of a and b, recursively and without using the multiplication
# operator (*)
def multiply(a, b)

end

# The Lucas Sequence is a sequence of numbers. The first number of the sequence 
# is 2. The second number of the Lucas Sequence is 1. To generate the next number
# of the sequence, we add up the previous two numbers. For example, the first six
# numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Accepts a number representing a length as an arg. The method returns an array 
# containing the Lucas Sequence up to the given length. A recursive method.
def lucasSequence(length)

end

# The Fundamental Theorem of Arithmetic states that every positive integer is 
# either a prime or can be represented as a product of prime numbers.

# Accepts a number and returns an array representing the prime factorization 
# of the given number. This means that the array should contain only prime 
# numbers that multiply together to the given num. The array returned should 
# contain numbers in ascending order. A recursive method.
def prime_factorization(num)

end