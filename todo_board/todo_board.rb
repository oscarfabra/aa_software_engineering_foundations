require_relative 'list.rb'

class TodoBoard

  # Creates a new TodoBoard instance
  def initialize(label)
    @list = List.new(label)
  end

  # Prompts the user to enter a command and performs the appropriate action
  # on the list
  def get_command
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(" ")
    case cmd
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      (args[1].nil?)? @list.up(args[0].to_i) : @list.up(args[0].to_i, args[1].to_i)
    when 'down'
      (args[1].nil?)? @list.down(args[0].to_i) : @list.down(args[0].to_i, args[1].to_i)
    when 'swap'
      @list.swap(args[0].to_i, args[1].to_i)
    when 'sort'
      @list.sort_by_date!
    when 'priority'
      @list.print_priority
    when 'print'
      (args.length == 0)? @list.print : @list.print_full_item(args[0].to_i)
    when 'toggle'
      @list.toggle_item(args[0].to_i)
    when 'rm'
      @list.remove_item(args[0].to_i)
    when 'purge'
      @list.purge
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