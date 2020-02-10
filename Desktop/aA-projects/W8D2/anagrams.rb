
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
# # p first_anagram?("elvis", "lives")    #=> true

# # Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and 
# the second string is empty at the end of the iteration.

def second_anagram?(word,word2)
    word.each_char.with_index |letter,idx| do 
        letter_index=word2.find_index(letter)
        word2.slice!(letter_index)
    end
end