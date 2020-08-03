require_relative 'phase_2.rb'

# Accepts any number of matrices as arguments. The method returns a new matrix
# representing the sum of the arguments. Matrix addition can only be performed 
# on matrices of similar dimensions, so if all of the given matrices do not 
# have the same "height" and "width", then return nil.
def matrix_addition_reloaded(*matrices)
  return nil if !matrices_with_equal_dimensions?(matrices)
  new_matrix = Array.new(matrices[0].length) { Array.new(matrices[0][0].length, 0) }
  matrices.each { |matrix| new_matrix = matrix_addition(new_matrix, matrix) }
  new_matrix
end

def matrices_with_equal_dimensions?(matrices)
  matrices.all? { |matrix| matrix.length == matrices[0].length && matrix[0].length == matrices[0][0].length }
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# Accepts a 2-dimensional array as an argument. The method returns a boolean 
# indicating whether or not any row or column is completely filled with the 
# same element. Assumes that the 2-dimensional array has "square" dimensions, 
# meaning it's height is the same as it's width.
def squarocol?(matrix)
  row_with_same_element?(matrix) || col_with_same_element?(matrix)
end

def row_with_same_element?(matrix)
  matrix.each do |row|
    return true if row.all? { |ele| ele == row[0] }
  end
  false
end

def col_with_same_element?(matrix)
  (0...matrix[0].length).each do |i|
    return true if matrix.all? { |row| row[i] == matrix[0][i] }
  end
  false
end

# p squarocol?([
#   [:a, :x , :d],
#   [:b, :x , :e],
#   [:c, :x , :f],
# ]) # true

# p squarocol?([
#   [:x, :y, :x],
#   [:x, :z, :x],
#   [:o, :o, :o],
# ]) # true

# p squarocol?([
#   [:o, :x , :o],
#   [:x, :o , :x],
#   [:o, :x , :o],
# ]) # false

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 7],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 0],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # false

# Accepts 2-dimensional array as an argument. The method returns a boolean 
# indicating whether or not the array contains all of the same element across 
# either of its diagonals. Assumes that the 2-dimensional array has "square" 
# dimensions, meaning it's height is the same as it's width.
def squaragonal?(matrix)
  diagonal_1_with_same_element?(matrix) || diagonal_2_with_same_element?(matrix)
end

def diagonal_1_with_same_element?(matrix)
  (0...matrix.length).each do |i|
    return false if matrix[i][i] != matrix[0][0]
  end
  true
end

def diagonal_2_with_same_element?(matrix)
  (0...matrix.length).each do |i|
    return false if matrix[-1 - i][i] != matrix[-1][0]
  end
  true
end

# p squaragonal?([
#   [:x, :y, :o],
#   [:x, :x, :x],
#   [:o, :o, :x],
# ]) # true

# p squaragonal?([
#   [:x, :y, :o],
#   [:x, :o, :x],
#   [:o, :o, :x],
# ]) # true

# p squaragonal?([
#   [1, 2, 2, 7],
#   [1, 1, 6, 7],
#   [0, 5, 1, 7],
#   [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#   [1, 2, 2, 5],
#   [1, 6, 5, 0],
#   [0, 2, 2, 7],
#   [5, 2, 9, 7],
# ]) # false

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The 
# top of the pyramid is the number 1. To generate further levels of the pyramid,
# every element is the sum of the element above and to the left with the element
# above and to the right. Nonexisting elements are treated as 0 when calculating
# the sum. For example, here are the first 5 levels of Pascal's triangle:
#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# Accepts a positive number, n, as an argument and returns a 2-dimensional array
# representing the first n levels of pascal's triangle.
def pascals_triangle(n)
  return [[1]] if n == 1
  triangle = [[1]]
  (2..n).each do |i|
    last_level = triangle.last
    next_level = Array.new(i, 0)
    next_level[0] = 1
    next_level[-1] = 1
    (1...i - 1).each do |j|
      next_level[j] = last_level[j - 1] + last_level[j]
    end
    triangle << next_level
  end
  triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]