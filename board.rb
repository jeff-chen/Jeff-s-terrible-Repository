class Board
  SIZE = 8
  BLANK = 0
  
  attr_accessor :places
  
  def initialize
    @places = Array.new(SIZE) { Array.new(SIZE, 0) }
    
  end
  
  def [](x,y)
    raise OutOfBoundsLolError if(x.to_i < 1 || y.to_i < 1 || y.to_i > SIZE || x.to_i > SIZE) 
    @places[x.to_i - 1][y.to_i - 1]
  end
  def []= (x,y, z)
    raise OutOfBoundsLolError if(x.to_i < 1 || y.to_i < 1 || y.to_i > SIZE || x.to_i > SIZE) 
    @places[x.to_i - 1][y.to_i - 1] = z
  end
  def add_piece(piece, x, y)
    self[x,y]= piece
  end

  def find_piece(piece)
    1.upto(SIZE) do |i|
      1.upto(SIZE) do |j|
        if self[i,j] == piece
          return [i,j]
        end
      end
    end
    nil
  end
  def move_piece(piece, x, y)
    coords = find_piece(piece)
    if coords
      #check if legal
      if coords[0] + x > SIZE || coords[0] + x < 1
        if x > 0
          x = SIZE - coords[0]
        else
          x = 1 - coords[0]
        end
      end
      if coords[1] + y > SIZE || coords[y] + y < 1
        if y > 0
          y = SIZE - coords[1]
        else 
          y = 1 - coords[1]
        end
      end
      if self[coords[0]+x,coords[1]+y] == BLANK
        self[coords[0], coords[1]] = BLANK
        self[coords[0]+x, coords[1]+y] = piece
      end
    end
  end
  
  def representation(i,j)
    self[i,j] == BLANK ? BLANK.to_s : self[i,j].symbol
  end
  def table
    str = ""
    1.upto(SIZE) do |i|
      1.upto(SIZE) do |j|
        str += "| " + representation(j,i) + " "
      end
      str += "|\n"
    end
    return str
  end
  

end
class OutOfBoundsLolError < Exception
  
end