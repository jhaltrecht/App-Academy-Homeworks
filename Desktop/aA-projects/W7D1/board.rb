require_relative "piecesRef"
require "byebug"

class Board
    attr_reader :sentinel
    # 8 rows in a chess board.  Use this for columns as well
    GridRowsSize=8
    def initialize
        
        @sentinel = NullPiece.instance
        @rows=Array.new(GridRowsSize){Array.new(GridRowsSize,sentinel)}
        setUpBoard
    end


    def setUpBoard
        back_pieces = [
        Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]
        
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(:white, self, [0, j])
            piece_class.new(:black, self, [6, j])
        end
         8.times do |j|
          Pawn.new(:white, self, [1, j]) 
          Pawn.new(:black, self, [7, j]) 
         end
         
    end

    def add_piece(piece,pos)
       self[pos]=piece
    end

    def render
        puts "   #{(0..7).to_a.join("  ")}"
        (0..7).each do |row|
            # debugger if row==1
            puts "#{row} #{@rows[row].join("")}"
        end
    end
    
    def move_piece(start_pos,end_pos)
        # raise invalid if not in piece valid
       raise "invalid position" if self[start_pos]==sentinel || self[end_pos]!=sentinel
       self[end_pos]=self[start_pos]
       self[end_pos].pos=end_pos
       self[start_pos]=sentinel
    end

    def [](pos)
        row,col=pos
        @rows[row][col]
    end

    def []=(pos,otherVal)
        row,col=pos
        @rows[row][col]=otherVal
    end

    def valid_pos?(pos)
        row,col=pos
        return true if row>=0 && row<=7 && col>=0 && col<=7
       false
    end

    def empty?(pos)
      return true if self[pos]==sentinel 
      false
    end



end


  b=Board.new
  p b.render
     b.move_piece([6,0],[2,0])

#   b.move_piece([1,4],[5,0])
#     b.move_piece([1,3], [5,3])
#     p b.render
# debugger
p b[[1,1]].moves
#  b.move_piece([1,1], [4,1])

#     b.move_piece([0,3], [4,6])

#  b.add_piece(Bishop.new(:white, self, [2,2]),[2,2])