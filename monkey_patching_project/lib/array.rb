# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  # Returns the difference between the largest and smallest element
  def span
    return nil if self.empty?
    self.max - self.min
  end

  # Returns a number representing the average value of the elements
  def average
    return nil if self.empty?
    self.sum.to_f / self.length
  end

  # Returns the median element of the array when sorted
  def median
    return nil if self.empty?
    self.sort!
    (length.odd?)? self[length / 2] : (self[length / 2 - 1] + self[length / 2]) / 2.0
  end

  # Returns a hash representing the count of each element of the array
  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

  # Returns the number of times a value appears in the array
  def my_count(ele)
    self.counts[ele]
  end

  # Returns the index where the given element is found in the array
  def my_index(ele)
    return nil if my_count(ele) == 0
    self.each_with_index { |val, i| return i if val == ele }
  end

  # Returns a new array without duplicate elements in the order they first 
  # appeared in the original array
  def my_uniq
    new_arr = []
    self.counts.each_key { |ele| new_arr << ele }
    new_arr
  end

  # Transposes a 2D array with square dimensions by returning a new 2D array where the 
  # horizontal rows are converted to vertical columns
  def my_transpose
    new_arr = Array.new(self.length) { Array.new(self.length) }
    self.each_with_index do |val_i, i|
      self.each_with_index do |val_j, j|
        new_arr[i][j] = self[j][i]
      end
    end
    new_arr
  end
end
