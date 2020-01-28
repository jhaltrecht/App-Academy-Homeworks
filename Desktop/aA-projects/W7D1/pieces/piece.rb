require_relative "slideable"
require_relative "stepable"
require_relative "../board"

class Piece
    def initialize(color,board,pos)
        @pos=pos
        @board=Board.new()
        @color=color
    end
# should return an array of places a Piece can move to
    def valid_moves
        movesArr=
    end
end




