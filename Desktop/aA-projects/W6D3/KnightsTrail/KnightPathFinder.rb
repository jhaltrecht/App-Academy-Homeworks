require 'byebug'
require_relative "../Treeskeleton/lib/00_tree_node.rb"
class KnightPathFinder
BoardSize=8
    attr_accessor :root_node
    def initialize(startPos)
        @startPos=startPos
        @considered_positions=[startPos] 
        # @board=Array.new(BoardSize){Array.new(BoardSize)}
        self.root_node=PolyTreeNode.new(startPos)
        build_move_tree
    end

    def build_move_tree
         tree=[self.root_node]
         newTree=[]
        while !tree.empty?
            node=tree.shift
            # debugger
            newMoves=new_move_positions(node)
            newMoves.each_with_index do |child,idx| 
                newMoves[idx]=PolyTreeNode.new(child)
                node.add_child(newMoves[idx])
            end
            tree+=newMoves
            newTree+=newMoves
        end
        return nil if newTree.empty?
        newTree
    end

    def find_path(end_pos)
        endNode=self.root_node.dfs(end_pos)
        trace_path_back(endNode) if !endNode.nil?
    end
    
    def trace_path_back(node)
        # debugger
        parentArr=[node]
        return if node.nil?
        parentArr<<node.parent
        node=node.parent
        until parentArr.last==nil
            parentArr<<node.parent
                    node=node.parent
        end
        parentArr.pop
        parentArr.reverse
    end

    def self.valid_moves(pos)
        pos=pos.value if !pos.is_a?(Array)
        posArr=[pos]
        row,col=pos
        return "invalid position passed" if !row.between?(0,BoardSize-1) || !col.between?(0,BoardSize-1)
        posArr<<[row-2,col+1]   if (row-2).between?(0,BoardSize-1) && (col+1).between?(0,BoardSize-1) 
        posArr<<[row-2,col-1]   if (row-2).between?(0,BoardSize-1) && (col-1).between?(0,BoardSize-1) 
        posArr<<[row+1,col+2]   if (row+1).between?(0,BoardSize-1) && (col+2).between?(0,BoardSize-1) 
        posArr<<[row+2,col-1]   if (row+2).between?(0,BoardSize-1) && (col-1).between?(0,BoardSize-1) 
        posArr<<[row+2,col+1]   if (row+2).between?(0,BoardSize-1) && (col+1).between?(0,BoardSize-1) 
        posArr<<[row-1,col+2]   if (row-1).between?(0,BoardSize-1) && (col+2).between?(0,BoardSize-1) 
        posArr<<[row+1,col-2]   if (row+1).between?(0,BoardSize-1) && (col-2).between?(0,BoardSize-1) 
        posArr<<[row-1,col-2]   if (row-1).between?(0,BoardSize-1) && (col-2).between?(0,BoardSize-1) 
        posArr
    end

    def new_move_positions(pos)
       validMoves= KnightPathFinder.valid_moves(pos)
       validMoves.reject!{|move| @considered_positions.include?(move)}
       @considered_positions+=validMoves
       validMoves
    end
    

end


 kpf = KnightPathFinder.new([0, 0])


p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
 p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
