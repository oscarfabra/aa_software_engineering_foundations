# Accepts an array and one or more procs as arguments. The method returns a new
# array containing the elements that return true when passed into all of the 
# given procs.
def conjunct_select(arr, *prcs)
  arr.select do |ele|
    prcs.all? { |prc| prc.call(ele) }
  end
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# Accepts a sentence as an argument. The method translates the sentence 
# according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the 
# following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word 
# (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the 
# word's first vowel to the end of the word and add 'ay' 
# (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, e, 
# i, o, u.
def convert_pig_latin(sent)
  arr = sent.split(" ").map do |word|
    if word.length < 3
      word
    elsif "aeiou".include?(word[0].downcase)
      word + "yay"
    else
      translate_non_vowel_word(word)
    end
  end
  arr.join(" ")
end

def translate_non_vowel_word(word)
  i = 0
  i += 1 until "aeiou".include?(word[i])
  new_word = word[i..-1] + word[0...i] + "ay"
  new_word.capitalize! if word == word.capitalize
  new_word
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# Accepts a sentence as an argument. The method translates the sentence 
# according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the 
# following rules:
# if the word ends with a vowel, simply repeat the word twice 
# (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the 
# word's last vowel, including the last vowel itself 
# (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, e,
# i, o, u.
def reverberate(sent)
  arr = sent.split(" ").map do |word|
    if word.length < 3
      word
    elsif "aeiou".include?(word[-1])
      word + word.downcase
    else
      translate_word_ends_with_non_vowel(word)
    end
  end
  arr.join(" ")
end

def translate_word_ends_with_non_vowel(word)
  i = word.length - 1
  i -= 1 until "aeiou".include?(word[i].downcase)
  word + word[i..-1]
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# Accepts an array and one or more procs as arguments. The method returns a new
# array containing the elements that return true when passed into at least one 
# of the given procs.
def disjunct_select(arr, *prcs)
  arr.select do |ele|
    prcs.any? { |prc| prc.call(ele) }
  end
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# Accepts a sentence as an argument. The method returns a new sentence where 
# the words alternate between having their first or last vowel removed. For 
# example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are 
# the letters a, e, i, o, u.
def alternating_vowel(sent)
  arr = sent.split(" ").map.with_index do |word, i|
    (i.even?)? remove_first_vowel(word) : remove_last_vowel(word)
  end
  arr.join(" ")
end

def remove_first_vowel(word)
  i = 0
  i += 1 until i == word.length || "aeiou".include?(word[i].downcase)
  return word if i == word.length
  word[0..i - 1] + word[i + 1..-1]
end

def remove_last_vowel(word)
  i = word.length - 1
  i -= 1 until i == -1 || "aeiou".include?(word[i].downcase)
  return word if i == -1
  word[0..i - 1] + word[i + 1..-1]
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# Accepts a sentence as an argument. The method translates each word of the 
# sentence according to the following rules:
# if the word ends with a vowel, simply repeat that vowel at the end of the 
# word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed 
# by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, e,
# i, o, u.
def silly_talk(sent)
  arr = sent.split(" ").map do |word|
    if "aeiou".include?(word[-1].downcase)
      word + word[-1].downcase
    else
      translate_to_silly(word)
    end
  end
  arr.join(" ")
end

def translate_to_silly(word)
  arr = word.split("").map do |c|
    ("aeiou".include?(c.downcase))? c + "b" + c.downcase : c
  end
  arr.join
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# Accepts a string as an argument. The method returns a "compressed" version 
# of the string where streaks of consecutive letters are translated to a single
# appearance of the letter followed by the number of times it appears in the 
# streak. If a letter does not form a streak (meaning that it appears alone), 
# then do not add a number after it.
def compress(str)
  new_str = ""
  i = 0
  while i < str.length
    new_str += str[i]
    j = i
    j += 1 until j == str.length || str[j] != str[i]
    new_str += (j - i).to_s if j - i > 1
    i = j
  end
  new_str
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"