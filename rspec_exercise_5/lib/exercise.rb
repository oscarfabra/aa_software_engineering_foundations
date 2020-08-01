# Returns a 2D array where each subarray contains the elements at the same 
# index from each argument
def zip(*arrays)
  result = []
  (0...arrays[0].length).each do |i|
    sub_arr = []
    arrays.each { |arr| sub_arr << arr[i] }
    result << sub_arr
  end
  result
end

# Returns a new array containing the elements that return true for exactly 
# one of the procs
def prizz_proc(arr, prc_1, prc_2)
  arr.select { |ele| (prc_1.call(ele) && !prc_2.call(ele)) || (prc_2.call(ele) && !prc_1.call(ele)) }
end

# Returns a 2D array where each subarray contains the elements at the same 
# index from each argument
def zany_zip(*arrays)
  max = arrays.max { |a, b| a.length <=> b.length }.length
  result = []
  (0...max).each do |i|
    sub_arr = []
    arrays.each { |arr| sub_arr << arr[i] }
    result << sub_arr
  end
  result
end

# Returns the element that has the largest result when passed into the block
def maximum(arr, &prc)
  arr.max do |a, b| 
    (prc.call(a) > prc.call(b) || prc.call(a) == prc.call(b))? 1 : -1
  end
end

# Returns a hash where keys are the results when the elements are given to the 
# block, and each value is an array containing the elements that result in the 
# corresponding key when given to the block
def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each { |ele| hash[prc.call(ele)] << ele }
  hash
end

# Returns the element that has the largest result when passed into the block
def max_tie_breaker(arr, prc_1, &prc_2)
  arr.max do |a, b|
    if prc_2.call(a) == prc_2.call(b)
      (prc_1.call(a) > prc_1.call(b))? 1 : -1
    elsif prc_2.call(a) > prc_2.call(b)
      1
    else
      -1
    end
  end
end

# Returns a new sentence where all letters before the first vowel and after the
# last vowel in each word are removed
def silly_syllables(sent)
  arr = sent.split(" ").map do |word|
    (word.count("aeiou") >= 2)? remove_letters(word) : word
  end
  arr.join(" ")
end

# Removes all letters before the first vowel and after the last vowel
def remove_letters(word)
  i = 0
  i += 1 until "aeiou".include?(word[i])
  j = word.length - 1
  j -= 1 until "aeiou".include?(word[j])
  word[i..j]
end