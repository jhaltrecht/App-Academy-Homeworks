require_relative "piece"
class Bishop < Piece
    attr_reader :symbol
    def initialize
        @symbol="♝"
        super(color,board,pos)
    end

    def move_dirs
        diagonal_dirs
    end
end