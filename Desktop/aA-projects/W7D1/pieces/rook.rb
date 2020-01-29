require_relative "piece"
class Rook<Piece
    include Slideable
  def symbol
    '♜'.colorize(@color)
  end
  protected
    def move_dirs
        vertical_dirs+horizontal_dirs
    end 

end