require_relative 'list.rb'

class TodoBoard

  # Creates a new TodoBoard instance
  def initialize
    @lists = {}
  end

  # Creates a new List with the given label and adds it to @lists
  def add_list(label)
    return false if @lists.keys.include?(label)
    @lists[label] = List.new(label)
    true
  end

  # Prints the labels of all the available lists
  def print_labels
    @lists.keys.each do |label|
      puts " #{label}"
    end
  end

  # Prints all lists
  def print_lists
    @lists.values.each do |list|
      list.print
    end
  end

  # Prompts the user to enter a command and performs the appropriate action
  # on the list
  def get_command
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(" ")
    case cmd
    when 'mklist'
      self.add_list(*args)
    when 'ls'
      self.print_labels
    when 'showall'
      self.print_lists
    when 'mktodo'
      (args[3].nil?)? @lists[args[0]].add_item(args[1], args[2]) : @lists[args[0]].add_item(args[1], args[2], args[3])
    when 'toggle'
      @lists[args[0]].toggle_item(args[1].to_i)
    when 'rm'
      @lists[args[0]].remove_item(args[1].to_i)
    when 'purge'
      @lists[args[0]].purge
    when 'up'
      (args[2].nil?)? @lists[args[0]].up(args[1].to_i) : @lists[args[0]].up(args[1].to_i, args[2].to_i)
    when 'down'
      (args[2].nil?)? @lists[args[0]].down(args[1].to_i) : @lists[args[0]].down(args[1].to_i, args[2].to_i)
    when 'swap'
      @lists[args[0]].swap(args[1].to_i, args[2].to_i)
    when 'sort'
      @lists[args[0]].sort_by_date!
    when 'priority'
      @lists[args[0]].print_priority
    when 'print'
      (args[1].nil?)? @lists[args[0]].print : @lists[args[0]].print_full_item(args[1].to_i)
    when 'quit'
      return false
    else
      puts "Sorry, that command is not recognized."
    end
    true
  end

  # Contains the main loop that will keep prompting the user until
  # #get_command returns false
  def run
    while self.get_command
    end
  end
end

# Creates and runs a new board for testing purposes
b = TodoBoard.new
b.run