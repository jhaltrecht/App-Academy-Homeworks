require_relative "piece"
module Slideable
    @HORIZONTAL_DIRS=[
        [0,1],
        [0,-1]
    ]
    @DIAGONAL_DIRS=[
        [1,1],
        [-1,-1],
        [-1,1],
        [1,-1]
    ]

    @VERTICAL_DIRS=[
        [1,0],
        [-1,0]
    ]
    # should return an array of places a piece can move to
     #    Don't allow a piece to move into a square already occupied by the same color piece,
    #  or to move a sliding piece past a piece that blocks it.

    def moves
        movesArr=[]
       move_directions=move_dirs

        move_directions.each do |(dx,dy)|
            movesArr+=grow_unblocked_moves_in_dir(dx,dy)
        end
        movesArr
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        row,col=@pos
        potNewPosition=[row+dx,col+dy]
        if @board.valid_pos?(potNewPosition) 
            movesArr<<@board[potNewPosition]
            movesArr+=grow_unblocked_moves_in_dir(row+dx,col+dy)
        else movesArr<<@board[potNewPosition] if self.color!= @board[potNewPosition].color
        end
        movesArr
    end


   
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end


end

