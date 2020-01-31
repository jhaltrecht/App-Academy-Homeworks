module Slideable
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

    def moves
        movesArr=[]
        move_directions=move_dirs
        move_directions.each do |(dx,dy)|
            movesArr+=grow_unblocked_moves_in_dir(dx,dy)
        end
        movesArr.uniq
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        unblockMovesArr=[]
        row,col=@pos
        potNewPosition=[row+dx,col+dy]   
        if @board.valid_pos?(potNewPosition) && @board.empty?(potNewPosition)
            unblockMovesArr<<potNewPosition
            row,col=potNewPosition
            dx+=1 if dx>0
            dy+=1 if dy>0
            dx-=1 if dx<0
            dy-=1 if dy<0
            unblockMovesArr+=grow_unblocked_moves_in_dir(dx,dy)
        elsif @board.valid_pos?(potNewPosition) && !@board.empty?(potNewPosition)
             unblockMovesArr<<potNewPosition if @color!= @board[potNewPosition].color 
        end
        unblockMovesArr
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

