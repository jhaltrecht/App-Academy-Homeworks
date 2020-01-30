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
            piece_class.new(:black, self, [7, j])
        end
         8.times do |j|
          Pawn.new(:white, self, [1, j]) 
          Pawn.new(:black, self, [6, j]) 
         end
         
    end

    def add_piece(piece,pos)
       self[pos]=piece
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

    def checkmate?(color)
        kingPos=find_king?(color)
        kRow,kCol=kingPos
        dupBoard=@rows.map{|row| row.dup}
         @rows[kRow][kCol].moves.all? do |move|
           dupBoard[kRow][kCol].pos=move
           in_check?(color)
         end
        # if all king moves in check return true
    end

    def find_king?(color)
         @rows.each do |row| 
            row.each do |col| 
                return col.pos if col.is_a?(King) && col.color==color
            end
        end
        nil
    end

    def in_check?(color)
        kingPos=find_king?(color)
        raise "King can't be found" if kingPos==nil
        @rows.each do |row| 
            row.each do |col| 
              return true if col.moves.include?(kingPos)
            end
        end
        false
    end

end


  b=Board.new
   p b.render