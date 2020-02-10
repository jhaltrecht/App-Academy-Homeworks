
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.
require 'byebug'
def first_anagram?(word,word2)
    anagrams=anagram?(word)
    anagrams.any?{|anagram| anagram.include?(word2)}
end
def anagram?(word)
    anagrams=[]
    return [word] if word.size < 2
    prev_anagrams=word[0..-2]
    perms=anagram?(prev_anagrams)
    perms.each do |perm| 
        (0..perm.length).each do |idx|
            # beginning middle and end so always 1 more than perm
            anagrams<<perm[0...idx] + word[-1] + perm[idx..-1]
            # alternative new_anagrams << anagram.dup.insert(i, string[-1])
        end
    end
    anagrams
end



# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# # Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and 
# the second string is empty at the end of the iteration.

def second_anagram?(word,word2)
    word.each_char do |letter| 
        letter_index=word2.index(letter)
        return false if letter_index.nil?
        word2.slice!(letter_index)
    end
    return true if word2.empty?
    false
end


# p second_anagram?("gizmo", "sally")    #=> false
#  p second_anagram?("elvis", "lives")    #=> true

# #  Write a method #third_anagram? that solves the problem by sorting both strings 
# alphabetically. The strings are then anagrams if and only if the sorted versions
#  are the identical.

def third_anagram?(word,word2)
    sorted_word1=word.chars.sort
    sorted_word2=word2.chars.sort
    sorted_word2==sorted_word1
end


# p third_anagram?("gizmo", "sally")    #=> false
#  p third_anagram?("elvis", "lives")    #=> true


#  Write one more method #fourth_anagram?. 
#  This time, use two Hashes to store the number of times each letter appears
#   in both words. Compare the resulting hashes.

p fourth_anagram?("gizmo", "sally")    #=> false
 p fourth_anagram?("elvis", "lives")    #=> true