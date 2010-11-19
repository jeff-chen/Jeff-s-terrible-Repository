class Queen < Piece
  def baseline_moves_for_board(board)
    moves = []
    x,y = file(board), rank(board)
    directions1 = [[1,0],[-1,0],[0,1],[0,-1]]
    directions1.each do |i|
      x1 = x + i[0]
      y1 = y + i[1]
      while(board.is_in_bounds?(x1, y1) && !board.occupied?(x1, y1))
        moves << [x1, y1]
        x1 = x1 + i[0]
        y1 = y1 + i[1]
      end
      if(board.is_in_bounds?(x1, y1) && board.occupied?(x1, y1) && board[x1, y1].player != self.player)
        moves << [x1, y1]
      end
    end
    directions1 = [1, -1]
    directions2 = [1, -1]
    directions1.each do |i|
      directions2.each do |j|
        x1 = x + i
        y1 = y + j
        while(board.is_in_bounds?(x1, y1) && !board.occupied?(x1, y1))
          moves << [x1, y1]
          x1 = x1 + i
          y1 = y1 + j
        end
        if(board.is_in_bounds?(x1, y1) && board.occupied?(x1, y1) && board[x1, y1].player != self.player)
          moves << [x1, y1]
        end
      end
    end
    moves
  end
end
