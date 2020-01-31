module Stepable
        HORIZONTAL_DIRS=[
        [0,1],
        [0,-1]
].freeze
    DIAGONAL_DIRS=[
        [1,1],
        [-1,-1],
        [-1,1],
        [1,-1]
].freeze

    VERTICAL_DIRS=[
        [1,0],
        [-1,0]
].freeze

KNIGHTMOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
     def moves
        movesArr=[]
        move_directions=move_dirs
        row,col=pos
        move_directions.each do |(dx,dy)|
            newPotPosition=[row+dx,col+dy]
            if @board.valid_pos?(newPotPosition) && @board.empty?(newPotPosition)
                movesArr<<newPotPosition 
            elsif @board.valid_pos?(newPotPosition) && !@board.empty?(newPotPosition)
                movesArr<<newPotPosition if @color!= @board[newPotPosition].color 
            end
        end
        movesArr
    end


    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def vertical_dirs
        VERTICAL_DIRS
    end

    def knight_moves
        KNIGHTMOVES
    end






end