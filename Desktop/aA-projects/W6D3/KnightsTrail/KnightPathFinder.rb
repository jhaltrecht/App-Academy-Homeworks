
require_relative "../Treeskeleton/lib/00_tree_node.rb"
class KnightPathFinder
BoardSize=8
    def initialize(startPos)
        @board=Array.new(BoardSize){Array.new(BoardSize)}
        @self.root_node=Tree.new(startPos)
        build_move_tree
        @considered_positions=[startPos]


    end

    # build the move tree, beginning with self.root_node
    def build_move_tree
        # traverse when find path called
    end

    def self.valid_moves(pos)
        row,col=pos
        return "invalid position passed" if !row.between?(BoardSize-1) || !col.between?(BoardSize-1)
        @considered_positions<<@board[row+1][col]     if (row+1).between?(BoardSize-1)
        @considered_positions<<@board[row-1][col]     if (row-1).between?(BoardSize-1)
        @considered_positions<<@board[row][col+1]     if (col+1).between?(BoardSize-1)
        @considered_positions<<@board[row][col-1]     if (col-1).between?(BoardSize-1)
        @considered_positions<<@board[row+1][col+1]   if (row+1).between?(BoardSize-1) && (col+1).between?(BoardSize-1) 
        @considered_positions<<@board[row-1][col+1]   if (row-1).between?(BoardSize-1) && (col+1).between?(BoardSize-1) 
        @considered_positions<<@board[row+1][col-1]   if (row+1).between?(BoardSize-1) && (col-1).between?(BoardSize-1) 
        @considered_positions<<@board[row-1][col-1]   if (row-1).between?(BoardSize-1) && (col-1).between?(BoardSize-1) 
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
        # filter out any positions that are already in @considered_positions
        # add the remaining new positions to @considered_positions and return these new positions.
    end

    # def [](pos)
    #     row,col=pos
    #     @board[row][col]
    # end

    # def []=(pos,val)
    #     row,col=pos
    #     @board[row][col]=val
    # end


end


