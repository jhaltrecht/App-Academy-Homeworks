require_relative 'tic_tac_toe'
class TicTacToeNode
  attr_reader :board,:next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board=board
    @next_mover_mark=next_mover_mark
    @prev_move_pos=prev_move_pos unless prev_move_pos.nil?
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    (0...@board.length).each do |row|
        (0...@board.length).each do |col|
            pos=[row,col]
            if self[pos].empty
            node=@board.dup
            node.place_mark(pos,next_mover_mark)
                if node.next_mover_mark== :x ? :o : :x)
                  prev_move_pos=pos
            end
                end
        end
    end
  end

  def losing_node?(elevator)

  end


end
