# Returns a hash where each key is an element of the array and it's 
# corresponding value is the number of times it appears in the array
def element_count(arr)
  hash = Hash.new(0)
  arr.each { |ele| hash[ele] += 1 }
  hash
end

# Mutates the original string by replacing chars of the string with their 
# corresponding values in the hash, if the char is a key of the hash
def char_replace!(str, hash)
  (0...str.length).each do |i|
    str[i] = hash[str[i]] if hash.has_key?(str[i])
  end
  str
end

# Returns the total product of all elements multiplied together
def product_inject(arr)
  arr.inject(:*)
end