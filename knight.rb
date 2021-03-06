class Knight < Piece
  def symbol
    "N"
  end
  
  def baseline_moves_for_board(board)
    return_moves = []
    base_moves = [[1, 2], [1, -2], [2, -1], [2, 1], [-1, -2], [-1, 2], [-2, 1], [-2, -1]]
    moves = base_moves.map{|d| [file(board) + d[0], rank(board) + d[1]]}
    moves.each do |move| 
      
      if board.is_in_bounds?(move[0], move[1])
        if !board.occupied?(move[0], move[1])
          return_moves << move
        else
          return_moves << move if board[move[0], move[1]].player != self.player
        end
      end
    end
    return_moves
  end
end