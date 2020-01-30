require_relative "slideable"
require_relative "stepable"



class Piece
    attr_reader :board,:color
    attr_accessor :pos
    def initialize(color,board,pos)
         @pos=pos
         @board=board
         @color=color
        board.add_piece(self, pos)
    end

    def inspect
        # [symbol,pos]
        pos
    end

     def to_s
    " #{symbol} " 
    end

end

    




