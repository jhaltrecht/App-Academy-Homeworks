require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node=TicTacToeNode.new(game.board, mark)
    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end
    # case where we coulnd't find a winner
    node.children.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end
    raise "there are no non-losing nodes"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
