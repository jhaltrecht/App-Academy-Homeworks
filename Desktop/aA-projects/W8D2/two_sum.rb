# Given an array of unique integers and a target sum, determine
#  whether any two integers in the array sum to that amount.
require 'byebug'

def two_sum?(arr, target_sum)
    # your code here...
end

# check every possible pair. If we sum each element with every other, 
# we're sure to either find the pair that sums to the target, or determine 
# that no such pair exists.
def bad_two_sum?(arr,target_sum)
    (0...arr.length).each do |start_idx|
        (start_idx+1...arr.length).each do |next_idx|
            return true if arr[start_idx]+arr[next_idx]==target_sum
        end
    end
    false
end
# use sorting first
def okay_two_sum?(arr,target_sum)
   (0...arr.length).each do |idx|
    return false if arr[idx]>target_sum || arr[idx]+arr[idx+1]>target_sum
    return true if arr[idx]+arr[idx+1]==target_sum
   end
end

def hash_sum?(arr,target_sum)
   hash={}
   arr.each do |el|
    return true if hash[target_sum - el]
    hash[el]=true
   end
false
end

arr = [0, 1, 5, 7]
p hash_sum?(arr, 6) # => should be true
p hash_sum?(arr, 10) # => should be false