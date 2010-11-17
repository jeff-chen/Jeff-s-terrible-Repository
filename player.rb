class Player
  attr_accessor :name, :color
  WHITE_NAME = "White Player"
  BLACK_NAME = "Black Player"
  
  def initialize( name = "", color="")
    @name = name
    @color = BLACK_NAME if color =~ /^b/i
    @color = WHITE_NAME if color =~ /^w/i
  end
  
  def white?
    @color == WHITE_NAME
  end
  
  def black?
    @color == BLACK_NAME
  end
  
  def pieces(game)
    if game.board
      things = []
      1.upto(Board::SIZE) do |i|
        1.upto(Board::SIZE) do |j|
          things << game.board[i,j] if game.board[i,j].is_a?(Piece) && game.board[i,j].player == self
        end
      end
      return things
    end
    []
  end
end