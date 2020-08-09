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
    puts "".ljust(49, '-')
    puts "#{@label.upcase}".center(49)
    puts "".ljust(49, '-')
    puts "Index | Item".ljust(29) + "| Deadline".ljust(13) + "| Done".ljust(7)
    puts "".ljust(49, '-')
    @items.each_with_index do |item, i|
      item_row = "#{i}".ljust(6) 
      item_row += "| #{item.title}".ljust(23)
      item_row += "| #{item.deadline}".ljust(13)
      item_row += "| [#{(item.done)? "✓" : " "}]"
      puts item_row
    end
    puts "".ljust(49, '-')
  end

  # Prints all information for the item at the given index
  def print_full_item(index)
    return nil if !self.valid_index?(index)
    item = @items[index]
    puts "".ljust(49, '-')
    item_header = "#{item.title}".ljust(32) 
    item_header += "#{item.deadline}".ljust(10)
    item_header += "[#{(item.done)? "✓" : " "}]".rjust(7)
    puts item_header
    puts "#{item.description}".ljust(49)
    puts "".ljust(49, '-')
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

  # Flips the current state of the item at the given index
  def toggle_item(index)
    return false if !self.valid_index?(index)
    @items[index].toggle
    true
  end

  # Permanently deletes the item of the list at the given index
  def remove_item(index)
    return false if !self.valid_index?(index)
    @items.delete_at(index)
    true
  end

  # Removes all items that are currently marked as done
  def purge
    @items.delete_if { |item| item.done }
  end
end