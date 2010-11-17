class Player
  attr_accessor :name, :color
  WHITE_NAME = "White Player"
  BLACK_NAME = "Black Player"
  
  def initialize(name = "", color="")
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
end