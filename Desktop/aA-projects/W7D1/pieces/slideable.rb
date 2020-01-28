require_relative "piece"
module Slideable
    @HORIZONTAL_DIRS=[
        [0,1],
        [0,-1]
    ]
    @DIAGONAL_DIRS=[
        [1,1],
        [-1,-1],
        [-1,1]
        [1,-1]
]
    # should return an array of places a piece can move to
    def moves
       move_directions=move_dirs


    #    Don't allow a piece to move into a square already occupied by the same color piece,
    #  or to move a sliding piece past a piece that blocks it.
    
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end


end

