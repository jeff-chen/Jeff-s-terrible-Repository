class King < Piece
  attr_accessor :moved
  BLACK_SPOT = [5, 1]
  WHITE_SPOT = [5, 8]
  
  
  def baseline_moves_for_board(board)
    return_moves = []
    base_moves = [[1, 1], [1, 0], [1, -1], [0, 1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
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
    return_moves << castle_move(board)
    return_moves.compact
  end
  
  
  def castle_move(board)
    xy = position_on_board(board)
    if xy == (player.white? ? WHITE_SPOT : BLACK_SPOT)
      if !@moved && !board.occupied?(xy[0] + 1, xy[1]) && !board.occupied?(xy[0] + 2, xy[1]) && board.occupied?(xy[0] + 3, xy[1]) && (board[xy[0]+3, xy[1]].is_a?(Rook) && board[xy[0]+3, xy[1]].player == self.player)
        return [xy[0] + 2, xy[1]]
      end
      if !@moved && !board.occupied?(xy[0] - 1, xy[1]) && !board.occupied?(xy[0] - 2, xy[1]) && !board.occupied?(xy[0] - 3, xy[1]) && board.occupied?(xy[0] - 4, xy[1]) && (board[xy[0]-4, xy[1]].is_a?(Rook) && board[xy[0]-4, xy[1]].player == self.player)
        return [xy[0] - 2, xy[1]]
      end
    end
    return nil
  end
end