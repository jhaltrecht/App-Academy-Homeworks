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
    movesArr<<[row+1,col] if forward_dirs==1
    movesArr<<[row+1,side_attacks+col] if side_attacks==1 || side_attacks==-1
    movesArr
  end

  def at_start_row?
    row,col=@pos
    return true if row==1 && @color==:white || row==7 && @color==:black
    false
  end

  def forward_dirs
    row,col=@pos
    newPotPos=[row+1,col]
    return 1 if @board.empty?(newPotPos) && @board.valid_pos?(newPotPos)
    return -1
  end

  def side_attacks
    row,col=@pos
    newPotPosRight=[row+1,col+1]
    newPotPosLeft=[row+1,col-1]
    return 1 if @board.valid_pos?(newPotPosRight) && !@board.empty?(newPotPosRight) && @board[newPotPosRight].color!=@color
    return -1 if @board.valid_pos?(newPotPosLeft) && !@board.empty?(newPotPosLeft) && @board[newPotPosLeft].color!=@color
    0
  end

end