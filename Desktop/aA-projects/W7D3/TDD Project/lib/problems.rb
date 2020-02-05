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

   
class TowersOfHanoiGame
    def initialize
        @disks=[[1,3],[],[4,5,7]]
    end

    def play
        # until game.won
    end

    def move(start_pos,end_pos)
        raise "can't move from a blank space" if @disks[start_pos].empty?
        if @disks[end_pos].empty?
           topEl=@disks[start_pos].pop
           return @disks[end_pos]<<topEl
        end
        raise "can't move a bigger object on top" if @disks[start_pos].last>@disks[end_pos].last

    end

    def won
        if @disks.count{|disk| disk.empty?}==2 
            @disks.each do |disk|  
                if !disk.empty?
                    return true if disk==disk.sort.reverse
                    return false
                end
            end
        end
   false
   end



end
     