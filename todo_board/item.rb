class Item
  attr_accessor :title, :description
  attr_reader :deadline
  
  # Returns true if the given string is a valid date of the form YYYY-MM-DD
  def self.valid_date?(str)
    arr = str.split("-")
    return false if arr.length != 3
    return false if arr.any? { |ele| !Integer(ele, exception: false) }
    return false if !(1..12).include?(arr[1].to_i)
    return false if !(1..31).include?(arr[2].to_i)
    true
  end

  # Creates a new Item instance
  def initialize(title, deadline, description)
    raise "invalid date" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
  end

  # Sets the item's deadline
  def deadline=(new_deadline)
    raise "invalid date" if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end
end