require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
    attr_reader :board,:next_mover_mark, :prev_move_pos

    def initialize(board, next_mover_mark, prev_move_pos = nil)
      @board=board
      @next_mover_mark=next_mover_mark
      @prev_move_pos=prev_move_pos unless prev_move_pos.nil?
    end

    def losing_node?(evaluator)
      # case where opponent just moved so our turn
            # return board.won? && board.winner != evaluator
        if @next_mover_mark==evaluator
             return true if @board.won?
            return children.all?{|child| child.losing_node?(evaluator)}
        # case where we just moved so their turn
        else
              return false if @board.over? 
             return children.any?{|child| child.losing_node?(evaluator)}
        end
      end



 def winning_node?(evaluator)
       return @board.winner == evaluator if @board.over?

        if @next_mover_mark==evaluator
          return true if @board.over? 
            return children.any?{|child| child.winning_node?(evaluator)}
        # case where we just moved so their turn
        else
            return false if @board.won?
             return children.all?{|child| child.winning_node?(evaluator)}
        end
      
 end



    # This method generates an array of all moves that can be made after
    # the current move.
    def children
      next_mover_mark_temp=@next_mover_mark

      nodes=[]
      # debugger
       (0...@board.rows.length).each do |row|
          (0...@board.rows.length).each do |col|
              if @board.rows[row][col].nil?
                prev_move_pos_temp=[row,col]
              nodeTemp=@board.dup
              nodeTemp.rows[row][col]=next_mover_mark_temp
              if next_mover_mark_temp==:x
                next_mover_mark_temp=:o
              else next_mover_mark_temp=:x
              end
              node=TicTacToeNode.new(nodeTemp,next_mover_mark_temp, prev_move_pos_temp)
              nodes<<node
              next_mover_mark_temp=@next_mover_mark
              end
          end
       end
     nodes
    end

  

end


