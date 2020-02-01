require "colorize"
require "byebug"
require_relative "board"

require_relative "cursor"
class Display
    attr_reader :board,:cursor
    def initialize(board)
        @board=board
        @cursor=Cursor.new([0,0], board)
        @booleanVariable=false
    end

    def toggleBooleanVariable
        @booleanVariable=!@booleanVariable
        if booleanVariable
          puts self[pos].moves
          puts @board.in_check?(color)
        end
    end

  def build_grid
    @board.rows.map.with_index do |row, i|
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
    end
  end

  def colors_for(i, j)
    if @cursor.cursor_pos == [i, j] && @cursor.selected
      bg = :light_green
    elsif @cursor.cursor_pos == [i, j]
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end
    
    def renderLoop
        loop do
        @cursor.get_input
        render
        end
    end

    def render
        system("clear")
        puts "Arrow keys to move, space or enter to confirm."
        build_grid.each { |row| puts row.join }
    end

    # def render
    #     puts "   #{(0..7).to_a.join("  ")}"
    #     (0..7).each do |row|
    #         # debugger if row==1
    #         puts "#{row} #{board.rows[row].join("")}"
    #     end
    # end
end

