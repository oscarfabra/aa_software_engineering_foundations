# Returns a new array where the elements are the results of the block 
# when passed in each element of the original array
def my_map(arr, &prc)
  new_arr = []
  arr.each { |ele| new_arr << prc.call(ele) }
  new_arr
end

# Returns a new array where the elements are elements of the original array
# where the block resulted in true
def my_select(arr, &prc)
  new_arr = []
  arr.each { |ele| new_arr << ele if prc.call(ele) }
  new_arr
end

# Returns a number representing the count of elements that result in true 
# when passed into the block
def my_count(arr, &prc)
  count = 0
  arr.each { |ele| count += 1 if prc.call(ele) }
  count
end

# Returns true when at least 1 element of the array results in true 
# when passed into the block
def my_any?(arr, &prc)
  arr.each { |ele| return true if prc.call(ele) }
  false
end

# Returns true when all elements of the array result in true when passed 
# into the block
def my_all?(arr, &prc)
  arr.each { |ele| return false if !prc.call(ele) }
  true
end

# Returns true when none of the elements of the array result in true 
# when passed into the block
def my_none?(arr, &prc)
  arr.each { |ele| return false if prc.call(ele) }
  true
end