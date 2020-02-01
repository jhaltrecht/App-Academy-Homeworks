require_relative "board"
require_relative "humanPlayer"
class Game
attr_accessor :current_player
    def initialize
        @board=Board.new
        @display=Display.new(@board)
        @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
        @current_player=:white
    end

    def play
        until @board.checkmate?(:black) || @board.checkmate?(:white)
            begin
            @display.render
            movedArr=@players[@current_player].make_move
            @board.move_piece!(current_player,movedArr[0],movedArr[1])
            rescue
                puts "Error, try again"
                retry
            end
            notify_players
            debugger
            swap_turn!
        end

    end


    def swap_turn!
   @current_player == :white ? :black : :white
    end

    def notify_players
        puts "Checkmate! #{@current_player.color.capitalize} wins!" if @board.checkmate?(@current_player) 
        puts "Check!" if @board.in_check?(current_player) 
    end

end

g=Game.new()
debugger
g.play