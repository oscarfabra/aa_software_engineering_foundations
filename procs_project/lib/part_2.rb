# Returns the result of the block when passed the string with it's 
# characters reversed
def reverser(str, &prc)
  prc.call(str.reverse)
end

# Returns a new sentence where every word becomes the result of the block 
# when passed the original word of the sentence
def word_changer(sent, &prc)
  sent.split().map { |word| prc.call(word) }.join(" ")
end

# Returns the greater result of the two procs when each is passed the number
def greater_proc_value(n, prc_1, prc_2)
  res_1 = prc_1.call(n)
  res_2 = prc_2.call(n)
  (res_1 > res_2) ? res_1 : res_2
end

# Returns a new array containing elements of the original array that result 
# in true when passed into both procs
def and_selector(arr, prc_1, prc_2)
  arr.select { |n| prc_1.call(n) && prc_2.call(n) }
end

# Returns a new array where all of the elements at even indices are the results 
# when those elements are passed into the first proc and all of the elements at 
# odd indices are the results when those elements are passed into the second proc
def alternating_mapper(arr, prc_1, prc_2)
  arr.map.with_index { |n, i| (i.even?) ? prc_1.call(n) : prc_2.call(n) }
end