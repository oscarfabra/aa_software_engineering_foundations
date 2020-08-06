class Passenger
  attr_reader :name

  # Creates a new Passenger instance
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  # Returns true when flight_numbers contains the given number
  def has_flight?(flight_num)
    @flight_numbers.any? { |f_num| f_num.downcase == flight_num.downcase }
  end

  # Adds the given flight number to @flight_numbers
  def add_flight(flight_num)
    @flight_numbers << flight_num.upcase if !self.has_flight?(flight_num)
  end
end