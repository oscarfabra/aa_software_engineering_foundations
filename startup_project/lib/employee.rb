class Employee
  attr_reader :name, :title

  # Creates a new Employee instance
  def initialize(name, title)
    @name = name
    @title = title
    @earnings = 0
  end

  # Pays the employee
  def pay(amount)
    @earnings += amount
  end
end
