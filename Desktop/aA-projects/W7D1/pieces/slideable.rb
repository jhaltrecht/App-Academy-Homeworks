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

    def vertical_dirs
        VERTICAL_DIRS
    end



end

