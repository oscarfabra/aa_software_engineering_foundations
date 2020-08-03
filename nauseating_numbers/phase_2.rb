# Returns true if the given number has more divisors than all positive numbers
# less than the given number. For example, 24 is an anti-prime because it has 
# more divisors than any positive number less than 24. Math Fact: Numbers that
# meet this criteria are also known as highly composite numbers.
def anti_prime?(n)
  divisors = Hash.new(0)
  (2..n).each { |i| divisors[i] = divisors_count(i) }
  sorted = divisors.sort_by { |k, v| v }
  sorted.last[0] == n
end

def divisors_count(n)
  (2..n / 2).to_a.count { |i| n % i == 0 }
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# The two matrices are guaranteed to have the same "height" and "width". The 
# method returns a new matrix representing the sum of the two arguments. 
# To add matrices, we simply add the values at the same positions:

# # programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# # structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7
def matrix_addition(matrix_1, matrix_2)
  new_matrix = Array.new(matrix_1.length) { Array.new(matrix_1[0].length) }
  (0...matrix_1.length).each do |i|
    (0...matrix_1[0].length).each do |j|
      new_matrix[i][j] = matrix_1[i][j] + matrix_2[i][j]
    end
  end
  new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# Accepts any amount of numbers as arguments. The method returns an array 
# containing all of the common divisors shared among the arguments. For example,
# the common divisors of 50 and 30 are 1, 2, 5, 10. Assumes that all of 
# the arguments are positive integers.
def mutual_factors(*args)
  factors = []
  (1..args.min).each do |i|
    factors << i if args.all? { |n| n % i == 0 }
  end
  factors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# The tribonacci sequence is similar to that of Fibonacci. The first three 
# numbers of the tribonacci sequence are 1, 1, and 2. To generate the next 
# number of the sequence, we take the sum of the previous three numbers. The 
# first six numbers of tribonacci sequence are:
# 1, 1, 2, 4, 7, 13, ... and so on
# Accepts a number argument, n, and returns the n-th number of the tribonacci 
# sequence.
def tribonacci_number(n)
  return 1 if n == 1 || n == 2
  return 2 if n == 3
  tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274