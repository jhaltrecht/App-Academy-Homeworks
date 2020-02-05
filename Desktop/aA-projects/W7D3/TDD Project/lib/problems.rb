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

    def my_transpose(arr)
        (0...arr.length).map do |row|
            (0...arr.length).map do |col|
               arr[col][row]
            end
        end
    end

     def stock_picker(stocksPrices)
        max_difference=nil
        newArr=[]
         (0...stocksPrices.length).each do |row|
            (row+1...stocksPrices.length).each do |col|
                if stocksPrices[row]<stocksPrices[col]
                    if max_difference.nil? 
                        newArr=[row,col]
                        max_difference=stocksPrices[col]-stocksPrices[row]
                    elsif max_difference<stocksPrices[col]-stocksPrices[row]
                        max_difference=stocksPrices[col]-stocksPrices[row]
                        newArr=[row,col]
                    end
                end
            end
        end
        return newArr if !newArr.empty?
        nil
     end

   