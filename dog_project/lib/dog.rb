class Dog
  # Creates a new Dog instance
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  # Gets the name attribute
  def name
    @name
  end

  # Gets the breed
  def breed
    @breed
  end

  # Gets the age
  def age
    @age
  end

  # Sets the dog's age
  def age=(age)
    @age = age
  end

  # Returns the dog's bark according to its age
  def bark
    (@age > 3)? @bark.upcase : @bark.downcase
  end

  # Returns the dog's favorite_foods instance variable
  def favorite_foods
    @favorite_foods
  end

  # Returns true if the dog's @favorite_foods contain the given food item
  def favorite_food?(food)
    @favorite_foods.any? { |f| f.downcase == food.downcase }
  end
end