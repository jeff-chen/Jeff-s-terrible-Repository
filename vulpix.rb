class Vulpix < Piece
  attr_accessor :name
  attr_accessor :hp
  
  def initialize(name = "", hp = 0, x=0, y=0)
    super(x, y)
    @name = name
    @hp = hp
  end
  
  def to_s
    "Name: #{@name} HP: #{@hp}"
  end
  
  #def symbol
  #  "V"
  #end
  
end