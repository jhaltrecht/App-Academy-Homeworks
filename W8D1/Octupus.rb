require "byebug"
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octupus(fishArr)
    (0...fishArr.length-1).each do |idx|
        (idx+1...fishArr.length-1).each do |idx2|
            if fishArr[idx].length>fishArr[idx2].length
                fishArr[idx],fishArr[idx2]=fishArr[idx2],fishArr[idx]
            end
        end
    end
fishArr

end
# # Find the longest fish in O(n log n) time. 
# Hint: You saw a sorting algorithm that runs in O(n log n) in
#  the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.



def dominant_octupus(fishArr)
    return fishArr if fishArr.length<=1
    left_side=fishArr[0...fishArr.length/2]
    right_side=fishArr[fishArr.length/2..-1]
    
    sorted_left,sorted_right=dominant_octupus(left_side),dominant_octupus(right_side)
    
    merge(sorted_left,sorted_right)
end


def merge(left_arr,right_arr)

    sortedArr=[]
    until left_arr.empty? || right_arr.empty?
        if left_arr.first.length<right_arr.first.length
            sortedArr<<left_arr.shift
        else sortedArr<<right_arr.shift
        end
    end
     sortedArr+left_arr+right_arr
end


# Find the longest fish in O(n) time. 
# The octopus can hold on to the longest fish that you have found so far
#  while stepping through the array only once.
def clever_octupus(fishArr)
    maxElement=[]
    fishArr.each do |fish|
        maxElement=fish if fish.length>maxElement.length
    end
    maxElement
end

Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.


def slow_dance

fishArr=['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p slow_dance("up", tiles_array)


p slow_dance("right-down", tiles_array)
