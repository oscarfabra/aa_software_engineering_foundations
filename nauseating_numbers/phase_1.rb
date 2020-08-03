# Returns a count of the number of distinct pairs of elements that have a sum of
# zero. Assumes that the input array contains unique elements.
def strange_sums(arr)
  count = 0
  (0...arr.length - 1).each do |i|
    count += 1 if arr[i + 1..-1].include?(-arr[i])
  end
  count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# Returns a boolean indicating whether or not a pair of distinct elements in the
# array result in the product when multiplied together. Assumes that the 
# input array contains unique elements.
def pair_product(arr, prod)
  (0...arr.length - 1).each do |i|
    return true if arr[i + 1..-1].include?(prod / arr[i])
  end
  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# Returns a new string where characters of the original string are repeated the
# number of times specified by the hash. If a character does not exist as a key
# of the hash, then it should remain unchanged.
def rampant_repeats(str, hash)
  arr = str.split("").map do |c|
    (hash.has_key?(c))? c * hash[c] : c
  end
  arr.join
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# Returns a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by
# itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are 
# perfect squares; 35 is not a perfect square.
def perfect_square?(n)
  i = 1
  i += 1 while i * i < n
  i * i == n
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false
