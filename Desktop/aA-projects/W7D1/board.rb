require_relative "piecesRef"
require "byebug"

class Board
    attr_reader :sentinel
    # 8 rows in a chess board.  Use this for columns as well
    GridRowsSize=8
    def initialize(fill_board = true)
        
        # @sentinel = NullPiece.instance
        @rows=Array.new(GridRowsSize){Array.new(GridRowsSize,sentinel)}
        setUpBoard
    end


    def setUpBoard
        back_pieces = [
        Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]
        
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(:white, self, [0, j])
            piece_class.new(:black, self, [7, j])
        end
    end

    def add_piece(piece,pos)
       self[pos]=piece
    end
    
    def move_piece(start_pos,end_pos)
        # raise invalid if not in piece valid
       raise "invalid position" if self[start_pos]==nil || self[end_pos]!=nil
       self[end_pos]=self[start_pos]
       self[start_pos]=nil
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
      return true  if self[pos]==nil 
    #   may need to check color
      false
    end

    private
    @sentinal


end


p b=Board.new
