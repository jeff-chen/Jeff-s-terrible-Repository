class Piece
  attr_accessor :position
  attr_accessor :player
  #
  #
  def initialize(player=nil,x=0, y=0)
    @player = player
    position = {:x => x, :y => y}
  end
  
  def symbol
    self.class.name[0].chr
  end
  
  def black?
    @player && @player.black?
  end
  
  def white?
    @player && @player.white?
  end
  
  def baseline_moves_for_board(board)
    []
  end
  
  def position_on_board(board)
    board.find_piece(self)
  end
  
  def rank(board)
    position_on_board(board)[1]
  end
  
  def file(board)
    position_on_board(board)[0]
  end
  def move_results_in_bad_things(board, move)
    status = false
    orig = board.find_piece(self)
    b2 = board.clone
    b2.move_piece(self, move[0], move[1])
    if black?
      status = true if board.black_king_capturable?
    end
    if white?
      status = true if board.white_king_capturable?
    end
    b2.move_piece(self, orig[0], orig[1])
    return status
  end
  def legal_moves_for_board(board)
    moves = baseline_moves_for_board(board)
    #moves.reject!{|move| move_results_in_bad_things(board, move)}
    #filter out boards for move
    moves
  end
end