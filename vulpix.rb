class Vulpix < Piece
  attr_accessor :name
  attr_accessor :hp
  
  def initialize(x=0, y=0, name = "", hp = 0)
    super(x, y)
    @name = name
    @hp = hp
  end
  
  def to_s
    "Name: #{@name} HP: #{@hp}"
  end
  
  
end