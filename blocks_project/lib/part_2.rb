# Returns true when all words are properly capitalized
def all_words_capitalized?(words)
  words.all? { |word| word.capitalize == word }
end

# Returns true when none of the urls end in '.com', '.net', '.io', or '.org'
def no_valid_url?(urls)
  valid_endings = ['.com', '.net', '.io', '.org']
  urls.none? do |url|
    valid_endings.any? { |ending| url.end_with?(ending) }
  end
end

# Returns true when at least one student has an average grade of 75 or higher
def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum.to_f / student[:grades].length >= 75
  end
end