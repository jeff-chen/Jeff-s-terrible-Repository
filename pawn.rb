class Pawn < Piece
  
  
  def direction
    @player.white? ? -1 : 1
  end
  
  def base
    @player.white? ? 7 : 2
  end
  
  def baseline_moves_for_board(board)
    moves = []
    if rank(board) == base
      moves << [file(board), rank(board) + 2*direction] unless board.occupied?(file(board), rank(board) + 2*direction)
    end
    diagonals = [[file(board)+1, rank(board)+direction], [file(board)-1, rank(board)+direction]]
    diagonals.each{|d| moves << d if (board.is_in_bounds?(d[0], d[1]) && board.occupied?(d[0], d[1]) && board[d[0], d[1]].player != self.player)}
    moves << [file(board), rank(board) + direction] unless !board.is_in_bounds?(file(board), rank(board) + direction) or board.occupied?(file(board), rank(board) + direction)
    moves
  end
end