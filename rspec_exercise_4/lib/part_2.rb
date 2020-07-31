# Returns all positive numbers less than the argument that also 
# divide the argument
def proper_factors(num)
  (1..num / 2).to_a.select { |i| num % i == 0 }
end

# Returns the sum of all proper factors of the given number
def aliquot_sum(num)
  proper_factors(num).sum
end

# Returns true when the number is equal to it's aliquot sum
def perfect_number?(num)
  num == aliquot_sum(num)
end

# Returns an array containing the first n perfect numbers
def ideal_numbers(n)
  arr = []
  i = 1
  while arr.length < n
    arr << i if perfect_number?(i)
    i += 1
  end
  arr
end