require_relative "tile"
require "byebug"

class Board

    def initialize(size=9)
    @size=size
    @grid=Array.new(@size){Array.new(@size)}
    @alreadySeen=[]
    setUp
    placeBombs
    end

    def render
        puts "  #{(0...@size).to_a.join(" ")}"
        num=0
        @grid.each do |row|
            puts "#{num} #{row.join(" ")}"
            num+=1
        end
    end

    def setUp
        (0...@size).each do |row|
            (0...@size).each do |col|
                @grid[row][col]=Tile.new()
            end
        end
    end
    
    def placeBombs
        until countBombs>=@size
            randRow=rand(@size)
            randCol=rand(@size)
            pos=[randRow,randCol]
            self[pos].value="B"
        end

    end

    def countBombs
        bombs=0
        (0...@size).each do |row|
            (0...@size).each do |col|
                bombs+=1 if @grid[row][col].value=="B"
            end
        end
        bombs
    end

    def [](pos)
        row,col=pos
        @grid[row][col]
    end

    def []=(pos,otherVal)
        row,col=pos
        @grid[row][col].value=otherVal
    end

     def allTilesRevealed?
        (0...@size).all? do |row|
            (0...@size).all? do |col|
                @grid[row][col].revealed==true if @grid[row][col].value !="B"
            end
        end
    end

    def lose?(pos)
     return true if self[pos].value=="B"
     false
    end

     def flag(pos)
        self[pos].flag
    end

   


    def revealed(pos)
        row,col=pos
        
        # @alreadySeen<<@grid[row][col]
        neighborsHash=neighbors(pos)
        selfBombs=countNeighborBombs(neighborsHash)
        self[pos].reveal(selfBombs)
        if selfBombs==0
            neighborsHash.each do |neighbor,idx|
                next if neighbor.value!="*"
                # @alreadySeen<<neighbor
                revealed(idx)
            end
        else return
        end

    end
  
    def neighbors(pos) 
        row,col=pos 
        neighborsHash=Hash.new{|h,k| h[k]=[]}
        neighborsHash[@grid[row+1][col]]=[row+1,col]      if (row+1).between?(0,@size-1) 
       neighborsHash[@grid[row-1][col]]= [row-1,col]      if (row-1).between?(0,@size-1) 
       neighborsHash[@grid[row][col+1]]= [row,col+1]      if (col+1).between?(0,@size-1) 
       neighborsHash[@grid[row][col-1]]= [row,col-1]  if (col-1).between?(0,@size-1) 
       neighborsHash[@grid[row-1][col+1]]= [row-1,col+1]   if (row-1).between?(0,@size-1) &&  (col+1).between?(0,@size-1)
       neighborsHash[@grid[row-1][col-1]]=[row-1,col-1]       if (row-1).between?(0,@size-1) &&  (col-1).between?(0,@size-1)
       neighborsHash[@grid[row+1][col+1]]= [row+1,col+1]   if (col+1).between?(0,@size-1) &&  (row+1).between?(0,@size-1) 
       neighborsHash[@grid[row+1][col-1]]=[row+1,col-1]  if (col-1).between?(0,@size-1) &&  (row+1).between?(0,@size-1) 
   neighborsHash
    end

    def countNeighborBombs(newNeighborsHash)
        newNeighborsHash.keys.count {|neighbor| neighbor.value=="B"}
         # count=0
        # # neighborsArr.each {|neighbor| count+=1 if neighbor.value=="B"}
        # count
    end


    


end



