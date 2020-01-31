require_relative "piecesRef"
require "byebug"

class Board
    attr_reader  :rows
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

    # cheater move method to move anywhere
    # when using this,have other methods do checks 
    def move_piece(start_pos,end_pos)
        # raise invalid if not in piece valid
        # debugger if self[start_pos]==sentinel || self[end_pos]!=sentinel || start_pos==end_pos 
       raise "invalid position" if self[start_pos]==sentinel || (self[end_pos]!=sentinel && (self[start_pos].color == self[end_pos].color)) || start_pos==end_pos 
        piece = self[start_pos]
       self[end_pos]=piece
       self[start_pos]=sentinel
     self[end_pos].pos=end_pos 
    #  self[4,4].pos=[6,4]


    
    end


    # self[end_pos] = piece
    # self[start_pos] = sentinel
    # piece.pos = end_pos

    
  

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
        movesArr=@rows[kRow][kCol].moves
        if movesArr==[] 
           return true if in_check?(color)
           return false
        end
         bool=movesArr.all? do |move|
            start_pos=self[[kRow,kCol]].pos
           move_piece(start_pos,move)
           checkedEl=in_check?(color)
           move_piece(move,start_pos)
           checkedEl
         end
         
         if bool
              @rows.each do |row| 
                    row.each do |col| 
                        next if col.is_a?(NullPiece)
                        if col.color==color && !(col.is_a?(King))
                            return false if col.valid_moves.length>0
                        end
                    end
              end
        end
         false
    end

      def in_check?(color)
        kingPos=find_king?(color)
        raise "King can't be found" if kingPos==nil
        @rows.each do |row| 
            row.each do |col| 
                # debugger if col.is_a?(Array)
             next if col.is_a?(NullPiece)
             next if color==col.color
                next if col.is_a?(King) 
                # debugger if col.is_a?(Pawn)
              return true if col.moves.include?(kingPos) && col.color!=color
            end
        end
        false
    end



    def find_king?(color)
         @rows.each do |row| 
            row.each do |col| 
                return col.pos if col.is_a?(King) && col.color==color
            end
        end
        nil
    end

    # def dup
    #     newBoard=[]
    #     newBoard=@rows.map do |row| 
    #         debugger
    #         row.map {|col| col.new(col.color, newBoard, col.pos)}
    #     end
    #     newBoard.sentinel = @sentinel
        
    # end

  
def render
        puts "   #{(0..7).to_a.join("  ")}"
        (0..7).each do |row|
            puts "#{row} #{rows[row].join("")}"
        end
    end
   

    private

  attr_reader :sentinel

end


