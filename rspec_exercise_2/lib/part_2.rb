# Returns true if the given string is the same forwards and backwards;
# false otherwise
def palindrome?(str)
  i = 0
  while i < str.length / 2
    return false if str[i] != str[str.length - i - 1]
    i += 1
  end
  true
end

# Returns an array containing all substrings of the given string
def substrings(str)
  sub_strings = []
  (0...str.length).each do |i|
    sub_str = ""
    (i...str.length).each do |j|
      sub_str += str[j]
      sub_strings << sub_str
    end
  end
  sub_strings
end

# Returns an array containing all substrings that are palindromes and 
# longer than 1 character
def palindrome_substrings(str)
  sub_strings = substrings(str)
  sub_strings.select do |sub_str|
    palindrome?(sub_str) && sub_str.length > 1
  end
end