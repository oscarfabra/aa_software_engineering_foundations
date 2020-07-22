class Bootcamp
  # Initializes the Bootcamp's instance variables
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end

  # Returns the bootcamp's @name
  def name
    @name
  end

  # Returns the bootcamp's @slogan
  def slogan
    @slogan
  end

  # Returns the bootcamp's @teachers
  def teachers
    @teachers
  end

  # Returns the bootcamp's @students
  def students
    @students
  end

  # Adds a teacher to the end of @teachers
  def hire(teacher)
    @teachers << teacher
  end

  # Adds a student to @students. Returns true if successful.
  def enroll(student)
    return false if @students.length == @student_capacity
    @students << student
    true
  end
  
  # Returns true if the student is enrolled in the bootcamp
  def enrolled?(student)
    @students.any? { |s| s.downcase == student.downcase }
  end
end
