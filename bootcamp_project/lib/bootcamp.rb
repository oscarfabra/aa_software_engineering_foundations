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

  # Returns the ratio between # students to 1 teacher
  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  # Adds the given grade to the student's grades array inside the @grades hash
  def add_grade(student, grade)
    return false if !enrolled?(student)
    @grades[student] << grade
    true
  end

  # Returns the number of grades the given student has
  def num_grades(student)
    @grades[student].length
  end

  # Returns the student's average grade rounded down to the nearest integer
  def average_grade(student)
    return nil if !enrolled?(student) || @grades[student].length == 0
    @grades[student].sum / @grades[student].length
  end
end
