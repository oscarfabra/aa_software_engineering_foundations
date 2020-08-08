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

  # Prints the label of the list and each item's title and deadline
  def print
    puts "".ljust(42, '-')
    puts "#{@label.upcase}".rjust(24)
    puts "".ljust(42, '-')
    puts "Index | Item".ljust(29) + "| Deadline".ljust(13)
    puts "".ljust(42, '-')
    @items.each_with_index do |item, i|
      puts "#{i}".ljust(6) + "| " + item.title.ljust(21) + "| " + item.deadline
    end
    puts "".ljust(42, '-')
  end

  # Prints all information for the item at the given index
  def print_full_item(index)
    return nil if !self.valid_index?(index)
    item = @items[index]
    puts "".ljust(42, '-')
    puts "#{item.title}".ljust(32) + item.deadline
    puts "#{item.description}".ljust(42)
    puts "".ljust(42, '-')
  end

  # Prints all information for the item at the top of the list
  def print_priority
    self.print_full_item(0)
  end

  # Moves the item at the given index up the list by continually swapping it
  # with the item directly above it the given amount of times
  def up(index, amount = 1)
    return false if !self.valid_index?(index)
    amount.times do 
      self.swap(index - 1, index) if index > 0
      index -= 1
    end
    true
  end

  # Moves the item at the given index down the list by continually swapping it
  # with the item directly below it the given amount of times
  def down(index, amount = 1)
    return false if !self.valid_index?(index)
    amount.times do
      self.swap(index, index + 1) if index < self.size - 1
      index += 1
    end
    true
  end

  # Sorts the items in increasing order according to their deadlines
  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end
end