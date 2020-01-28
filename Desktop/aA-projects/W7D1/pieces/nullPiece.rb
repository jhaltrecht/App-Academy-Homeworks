require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol
    def initialize
        @color
        @symbol
    end
end