require_relative "piece"

class Pawn<Piece
  def symbol
    '♟'.colorize(@color)
  end

  def moves
    move_dirs
  end

  def move_dirs
    movesArr=[]
    row,col=@pos
    if @color==:white
      movesArr<<[row+1,col] if forward_dirs==1
      movesArr<<[row+1,side_attacks+col] if side_attacks==1 || side_attacks==-1
      movesArr<<[row+2,col] if at_start_row? && @board.valid_pos?([row+2,col]) && @board.empty?([row+2,col])
    else 
      movesArr<<[row-1,col] if forward_dirs==1
      movesArr<<[row-1,side_attacks+col] if side_attacks==1 || side_attacks==-1
      movesArr<<[row-2,col] if at_start_row? && @board.valid_pos?([row-2,col]) && @board.empty?([row-2,col])
    end
    movesArr
  end

  def at_start_row?
    row,col=@pos
    return true if ((row==1 && @color==:white) || (row==6 && @color==:black))
    false
  end

  def forward_dirs
    row,col=@pos
    @color==:white ?  newPotPos=[row+1,col] : newPotPos=[row-1,col]
    return 1 if @board.valid_pos?(newPotPos) && @board.empty?(newPotPos) 
    return -1
  end

  def side_attacks
    row,col=@pos
    if @color==:white
    newPotPosRight=[row+1,col+1]
    newPotPosLeft=[row+1,col-1]
    else 
    newPotPosRight=[row-1,col+1]
    newPotPosLeft=[row-1,col-1]
    end
    return 1 if @board.valid_pos?(newPotPosRight) && !@board.empty?(newPotPosRight) && @board[newPotPosRight].color!=@color
    return -1 if @board.valid_pos?(newPotPosLeft) && !@board.empty?(newPotPosLeft) && @board[newPotPosLeft].color!=@color
    0
  end

end