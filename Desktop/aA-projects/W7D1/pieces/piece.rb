require_relative "slideable"
require_relative "stepable"
require "colorize"


class Piece
    def initialize(color,board,pos)
         @pos=pos
         @board=board
         @color=color
        board.add_piece(self, pos)
    end

    def valid_moves
    end

    def inspect
        symbol
    end

    def pos=(val)
        pos=val
        val
    end 
end

    




