# Returns a new array containing elements from the original array that result
# in false when passed into the block
def my_reject(arr, &prc)
  arr.select { |ele| !prc.call(ele) }
end

# Returns true when exactly one element of the array results in true when 
# passed into the block
def my_one?(arr, &prc)
  arr.count { |ele| prc.call(ele) } == 1
end

# Returns a new hash containing only the key=>value pairs that result in true
# when passed into the block
def hash_select(hash, &prc)
  hash.reject { |k, v| !prc.call(k, v) }
end

# Returns a new array of elements that result in true when exactly one of the
# procs results in true when given that element
def xor_select(arr, prc_1, prc_2)
  arr.select { |ele| (prc_1.call(ele) && !prc_2.call(ele)) || (prc_2.call(ele) && !prc_1.call(ele)) }
end

# Returns a number representing the count of procs that evaluate to true when 
# called with the given value
def proc_count(val, prcs)
  prcs.count { |prc| prc.call(val) }
end