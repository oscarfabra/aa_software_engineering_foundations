require_relative "room"

class Hotel
  # Initializes a new Hotel instance
  def initialize(name, capacities)
    @name = name
    @rooms = {}
    capacities.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
  end

  # Returns a version of @name where every word is capitalized
  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end
  
  # Returns @rooms
  def rooms
    @rooms
  end

  # Tells whether a given room exists in the hotel
  def room_exists?(name)
    @rooms.has_key?(name)
  end

  # Checks in the given person in the given room
  def check_in(person_name, room_name)
    if !self.room_exists?(room_name)
      puts "sorry, room does not exist"
    else
      if @rooms[room_name].add_occupant(person_name)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    end
  end

  # Returns true if at least 1 room is available
  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  # Prints out every room name followed by the number of available spaces in
  # that room
  def list_rooms
    @rooms.each do |name, room|
      puts "#{name}: #{room.available_space}"
    end
  end
end
