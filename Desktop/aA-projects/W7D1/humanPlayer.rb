require_relative "display"
class HumanPlayer
attr_reader :color, :display
    def initialize(color,display)
        @color=color
        @display=display
    end

    # def make_move
    #     puts "#{color}'s turn. Move to where?"
    #     input=@display.cursor.get_input
    #     if input
    #         begin
    #         @display.board.move_piece!(color,input)
    #         rescue
    #             puts "invalid move"
    #             retry 
    #         end
    #     end
    # end

    def make_move
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos
        end_pos = display.cursor.get_input
      else
        puts "#{color}'s turn. Move from where?"
        start_pos = display.cursor.get_input
      end
    end
    [start_pos, end_pos]
  end

    
end