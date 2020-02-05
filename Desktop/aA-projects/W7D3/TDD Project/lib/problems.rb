def my_uniq(arr)
    newArr=[]
    alreadySeen=[]
    arr.each do |el,idx|
        if !alreadySeen.include?(el)
            newArr<<el
            alreadySeen<<el
        end
    end
    newArr
end

class Array
    def two_sum
    newArr=[]
    (0...self.length).each do |x|
        (x+1...self.length).each do |y|
            newArr<<[x,y] if self[x]+self[y]==0
        end
    end
    newArr.sort_by{|arr| arr[0]}

    end
end

    p [-1, 0, 2, -2, 1,0].two_sum # => [[0, 4], [2, 3]]
