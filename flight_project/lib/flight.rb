class Flight
  attr_reader :passengers

  # Creates a new Flight instance
  def initialize(flight_num, capacity)
    @flight_number = flight_num
    @capacity = capacity
    @passengers = []
  end

  # Returns true when the number of @passengers has reached @capacity
  def full?
    @passengers.length == @capacity
  end

  # Boards a Passenger instance into this Flight
  def board_passenger(passenger)
    if !self.full?
      @passengers << passenger if passenger.has_flight?(@flight_number)
    end
  end

  # Returns an array containing the names of all of the @passengers
  def list_passengers
    list = []
    @passengers.each { |p| list << p.name }
    list
  end

  # Returns the element at the given index in @passengers
  def [](index)
    @passengers[index]
  end

  # Calls board_passenger passing in the given passenger
  def <<(passenger)
    self.board_passenger(passenger)
  end
end