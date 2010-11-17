class Piece
  attr_accessor :position
  #
  #
  def initialize(x=0, y=0)
    position = {:x => x, :y => y}
  end
  
  def symbol
    self.class.name[0].chr
  end
end