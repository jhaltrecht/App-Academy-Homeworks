require "colorize"

class Display
    def initialize(board,cursor)
        @board=board
        @cursor=cursor
    end
    
 def render
        puts "   #{(0..7).to_a.join("  ")}"
        (0..7).each do |row|
            # debugger if row==1
            puts "#{row} #{@board[[row]].join("")}"
        end
 end
end