class Room
  # Initializes a new Room instance
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  # Returns @capacity
  def capacity
    @capacity
  end

  # Returns @occupants
  def occupants
    @occupants
  end

  # Tells whether the number of @occupants has met @capacity
  def full?
    @occupants.length == @capacity
  end

  # Returns the number of additional occupants the room can take before 
  # reaching @capacity
  def available_space
    @capacity - @occupants.length
  end

  # Adds a new occupant to the Room
  def add_occupant(name)
    if !self.full?
      @occupants << name
      true
    else
      false
    end
  end
end
