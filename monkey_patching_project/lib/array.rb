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
end
