# Returns true when all words are properly capitalized
def all_words_capitalized?(words)
  words.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

# Returns true when none of the urls end in '.com', '.net', '.io', or '.org'
def no_valid_url?(urls)
  urls.none? do |url|
    url[-4..-1] == ".com" ||
    url[-4..-1] == ".net" ||
    url[-3..-1] == ".io" ||
    url[-4..-1] == ".org"
  end
end

# Returns true when at least one student has an average grade of 75 or higher
def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum.to_f / student[:grades].length > 75
  end
end