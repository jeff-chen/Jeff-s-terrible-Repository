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
  def legal_moves_for_board(board)
    moves = baseline_moves_for_board(board)
    #filter out boards for move
    moves
  end
end