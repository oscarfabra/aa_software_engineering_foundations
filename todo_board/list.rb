require_relative 'item.rb'

class List
  attr_accessor :label

  # Creates a new List instance
  def initialize(label)
    @label = label
    @items = []
  end

  # Creates a new Item with the given information and adds it to @items
  def add_item(title, deadline, description = "")
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  # Returns the number of items currently in the list
  def size
    @items.length
  end

  # Returns true if the given number is a valid position in the list
  def valid_index?(index)
    index >= 0 && index < @items.length
  end

  # Swaps the position of the items at the given indices in the list
  def swap(i, j)
    return false if !self.valid_index?(i) || !self.valid_index?(j)
    @items[i], @items[j] = @items[j], @items[i]
    true
  end

  # Returns the item of the list that is stored at the given index
  def [](index)
    return nil if !self.valid_index?(index)
    @items[index]
  end

  # Returns the item at the top of the list
  def priority
    self[0]
  end
end