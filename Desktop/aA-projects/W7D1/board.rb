require_relative "piece"

class Board
    # 8 rows in a chess board.  Use this for columns as well
    GridRowsSize=8
    def initialize()
        @grid=Array.new(GridRowsSize){Array.new(GridRowsSize)}
        setUpBoard
    end


    def setUpBoard
        (0...GridRowsSize).each do |rows|
            (0...GridRowsSize).each do |cols|
                if rows<2 || rows>5
                    @grid[rows][cols]=Piece.new()
                else @grid[rows][cols]=nil
                end
            end
        end
    end

    def move_piece(start_pos,end_pos)
       raise "invalid position" if self[start_pos]==nil || self[end_pos]!=nil
       self[end_pos]=self[start_pos]
       self[start_pos]=nil

    end

    def [](pos)
        row,col=pos
        @grid[row][col]
    end

    def []=(pos,otherVal)
        row,col=pos
        @grid[row][col]=otherVal
    end

end

