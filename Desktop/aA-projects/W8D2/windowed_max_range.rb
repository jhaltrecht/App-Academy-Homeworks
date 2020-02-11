require 'byebug'

def windowed_max_range(array, window_size)
    current_max_range=nil
   (0..(array.length-window_size)).each do |idx|
    # debugger
       min=array[idx..idx+window_size-1].min
       max=array[idx..idx+window_size-1].max
       max_range=max-min
       current_max_range=max_range if current_max_range.nil? || current_max_range<max_range
       max_range=0
    end
    current_max_range
end

class MinMaxStackQueue
    def initialize
        
    end
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8