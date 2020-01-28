require_relative "board"
require_relative "tile"
require "byebug"
require "yaml"
class Game

    def initialize(size=9)
        @size=size
        @board=Board.new(size)
    end

    def getAction
        puts "select \"r\" for reveal or \"f\" for flag or \"s\" to save"
            action=gets.chomp
            until valid_action(action)
                action=gets.chomp
            end
            action
    end

    def getPos
         puts "enter a position with x,y"
            pos=gets.chomp.split(",").map(&:to_i)
            until valid_pos(pos)
                pos=gets.chomp.split(",").map(&:to_i)
            end
            pos
    end

    # def takeTurn 
            
            
    # end

    def valid_action(action)
        return true if action=="r" || action=="f" ||action=="s"
        puts "incorrect action, please try again."
        false
    end

    def valid_pos(pos)
        row,col=pos
       return true if pos.is_a?(Array) && pos.length==2 && row.between?(0,@size-1) && col.between?(0,@size-1)
       puts "incorrect position, please try again."
       false
    end

    def play
        pos=getPos
        action=getAction
        until gameOver(pos)
            # added this to potentially prevent the recursive adjacent algorithm for efficiency sake
            return "sorry you hit a bomb and lost" if action=="r" && @board.lose?(pos)
            if action=="s"  
                save  
            elsif action=="r"
                 @board.revealed(pos)
            elsif action=="f" 
                @board.flag(pos)
            end

            @board.render 
            pos=getPos
            action=getAction
        end
       return "you win" if !@board.lose? (pos)
        puts "sorry you hit a bomb and lost"
    end

    def gameOver(pos)
        return true if @board.allTilesRevealed? || @board.lose?(pos)
        false
    end
end


    def save
        puts "Enter a filename to save at"
        filename=gets.chomp
        File.write(filename,YAML.dump(self))
    end
   
    # def load

    # end




    if $PROGRAM_NAME == __FILE__
  # running as script
       
#       put file name after game.rb  doesn't matter if quotes or not

  case ARGV.count
  when 0
    Game.new(9).play
  when 1
    # resume game, using first argument
    YAML.load_file(ARGV.shift).play
  end
end
