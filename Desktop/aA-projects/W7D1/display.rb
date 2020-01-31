require "colorize"
require "byebug"
require_relative "board"

require_relative "cursor"
class Display
    attr_reader :board
    def initialize(board)
        @board=board
        @cursor=Cursor.new([0,0], board)
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

    # def render
    #     system("clear")
    #     puts "Arrow keys to move, space or enter to confirm."
    #     build_grid.each { |row| puts row.join }
    # end

    def render
        puts "   #{(0..7).to_a.join("  ")}"
        (0..7).each do |row|
            # debugger if row==1
            puts "#{row} #{board.rows[row].join("")}"
        end
    end
end

d=Display.new(Board.new)
d.board.move_piece!([6,4],[4,4])
# d.board.move_piece!([7,5],[4,3])
# d.board.move_piece!([1,5],[2,0])
d.board.move_piece!([1,4],[3,0])
# d.board.move_piece!([7,7],[3,5])
# d.board.move_piece!([7,3],[2,4])
# d.board.move_piece!([1,3],[4,0])


d.board.move_piece!([0,5],[5,0])
d.board.move_piece!([0,7],[1,4])
d.board.move_piece!([7,0],[0,3])
# d.board.move_piece!([0,3],[7,0])

# d.board.move_piece!([7,2],[3,2])
d.board.move_piece!([0,4],[0,5])



p d.board.render
p d.board.in_check?(:white)
p d.board.checkmate?(:white)

# [1,5]
# queen [3,4]