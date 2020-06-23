# Returns the average of two numbers
def average(n, m)
  (n + m) / 2.0
end

# Returns the average of the numbers of the given array
def average_array(arr)
  arr.inject { |acc, n| acc + n } / arr.length.to_f
end

# Returns a new string where the original string is repeated n times
def repeat(str, n)
  new_str = ""
  n.times { new_str += str }
  new_str
end

# Returns a yelled version of the given string
def yell(str)
  str.upcase + "!"
end

# Returns the sentence with words alternating between uppercase and lowercase
def alternating_case(sent)
  new_words = sent.split(" ").map.with_index do |word, i|
    if i.even?
      word.upcase
    else
      word.downcase
    end
  end
  new_words.join(" ")
end