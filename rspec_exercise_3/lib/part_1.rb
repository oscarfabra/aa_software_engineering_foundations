# Returns true when the number can only be divided by 1 and itself
def is_prime?(num)
  return false if num < 2
  (2..num / 2).none? { |i| num % i == 0 }
end

# Returns the nth prime number sequentially
def nth_prime(n)
  i = 2
  while n > 0
    n -= 1 if is_prime?(i)
    i += 1
  end
  i - 1
end

# Returns an array of all prime numbers between min and max
def prime_range(min, max)
  (min..max).to_a.select { |n| is_prime?(n) }
end