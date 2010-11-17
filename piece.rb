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
end