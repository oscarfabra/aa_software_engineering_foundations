require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  # Creates a new Startup instance
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  # Returns true when the given title exists in the startup's @salaries
  def valid_title?(title)
    @salaries.has_key?(title)
  end

  # Returns true when our startup has more funding than the given startup
  def >(startup)
    @funding > startup.funding
  end

  # Creates a new Employee with the given args and adds it to @employees
  def hire(employee_name, title)
    raise("invalid title") if !valid_title?(title)
    @employees << Employee.new(employee_name, title)
  end

  # Returns the number of @employees
  def size
    @employees.length
  end

  # Pays the given employee
  def pay_employee(employee)
    raise("insufficient funds") if @salaries[employee.title] > @funding
    employee.pay(@salaries[employee.title])
    @funding -= @salaries[employee.title]
  end

  # Pays all the employees in out startup
  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  # Returns a number representing the average employee salary
  def average_salary
    sum = 0
    @employees.each { |employee| sum += @salaries[employee.title] }
    sum / @employees.length
  end

  # Closes our startup
  def close
    @employees = []
    @funding = 0
  end

  # Acquires the given startup
  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each { |title, salary| @salaries[title] = salary if !self.valid_title?(title) }
    @employees += startup.employees
    startup.close
  end
end
