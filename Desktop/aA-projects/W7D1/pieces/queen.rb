require_relative "piece"
class Queen<Piece
    include Slideable
   def symbol
    '♛'.colorize(@color)
  end

  protected
    def move_dirs
        vertical_dirs+horizontal_dirs+diagonal_dirs
    end 
end