require_relative "slideable"
require_relative "stepable"



class Piece
    attr_reader :board,:color
    attr_accessor :pos
    def initialize(color,board,pos)
         @pos=pos
         @board=board
         @color=color
        board.add_piece(self, pos)
    end

    def inspect
        [symbol,pos]
    end

    def to_s
    " #{symbol} " 
    end

    def 

        # returns moves that are valid on the board for a piece.
    def moves
        
    end


    # returns moves for a piece ot prevent a checkmate
    def valid_moves
        
        # dupBoard=@board.dup
        movesArr=moves
        movesArr.select! do |move|
            oldPiece=@board[move]
            next false if @pos==move
            start_pos=@pos
           begin
            @board.move_piece!(color,@pos,move)
           rescue
            next false
           end 
            if @board.in_check?(color)
                @board.move_piece!(color,@pos,start_pos)
                @board.add_piece(oldPiece,move)
                next false
            end
            @board.move_piece!(color,@pos,start_pos)
            @board.add_piece(oldPiece,move)
           true
        end
        movesArr
    end

    # def move_into_check?(end_pos)
    #     movesInCheckArr=[]
    #     dupBoard=@board.rows.map{|row| row.dup}
    #      @board.rows[kRow][kCol].moves.all? do |move|
    #         dupBoard[kRow][kCol].pos=move
    #         movesInCheckArr<<move if dupBoard.in_check?(color)
    #      end
    # end

    #  def in_check?(color)
    #     kingPos=find_king?(color)
    #     raise "King can't be found" if kingPos==nil
    #     @rows.each do |row| 
    #         row.each do |col| 
    #           return true if col.moves.include?(kingPos)
    #         end
    #     end
    #     false
    # end

end

    




