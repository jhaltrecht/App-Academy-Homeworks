# def my_min(arr)
#     (0...arr.length).each do |idx1|
#         (0...arr.length).each do |idx2|
#             if arr[idx1]>arr[idx2]
#                 break
#             elsif idx2==arr.length-1
#             return arr[idx1] if arr[idx1]<=arr[idx2]
#             end
#         end
#     end
# end
# do it more efficiently for phase 2
require "byebug"
def my_min(arr)
    min=0
 (0...arr.length).each do |idx1|
        if min.nil? 
           min=arr[idx1]
        elsif arr[idx1]<min
            min=arr[idx1]
        end
    end
    return min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#    p my_min(list)  # =>  -5

# # phase 1
# # Write a function that iterates through the array and finds all sub-arrays 
# using nested loops. First make an array to hold all sub-arrays.
#  Then find the sums of each sub-array and return the max.

# def largest_contiguous_subsum(arr)
#     subArr=[]
#     sum=nil
#     (0...arr.length).each do |idx1|
#         subArr=[]
#         (idx1...arr.length).each do |idx2|
#             subArr<<arr[idx2] 
#             # p subArr
#             if sum.nil?
#                 sum=subArr.sum
#             elsif sum<subArr.sum
#                 sum=subArr.sum
#             end
#         end
#     end
#     sum
# end






 

    # Write a new function using O(n) time with O(1) memory.
    #  Keep a running tally of the largest sum. 
    #  To accomplish this efficient space complexity, consider using two variables. 
    #  One variable should track the largest sum so far 
    #  and another to track the current sum. We'll leave the rest to you.

def largest_contiguous_subsum(arr)
      largest_sum=nil
      current_sum=0
    (0...arr.length).each do |idx1|
        current_sum+=arr[idx1]
                # debugger if idx1==2

        largest_sum=current_sum if largest_sum.nil? || largest_sum<current_sum
                current_sum=0 if current_sum<0

    end
    return largest_sum
end




    list = [5, 3, -7]
    p largest_contiguous_subsum(list) # => 8

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

      list = [2, 3, -6, 7, -6, 7]
    p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

     list = [-5, -1, -3]
    p largest_contiguous_subsum(list) # => -1 (from [-1])