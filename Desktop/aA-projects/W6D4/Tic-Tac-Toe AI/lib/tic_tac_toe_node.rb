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
      #  return true if evaluator.over? && evaluator.winner==next_mover_mark
          return false if evaluator.winner.nil? || evaluator.winner ||elevator.tied?   
      children.all?{|child| losing_node(child)} 
      true
    end


    def winning_node?(evaluator)
        return true if evaluator.winner 
      children.any?{|child| losing_node(child)} 
      false
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


