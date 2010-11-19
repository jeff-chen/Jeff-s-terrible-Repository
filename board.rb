class Board
  SIZE = 8
  VERTICAL_SIZE = 8
  BLANK = ""
  
  attr_accessor :places
  
  def initialize
    @places = Array.new(SIZE) { Array.new(SIZE, BLANK) }
    
  end
  

  def pieces
    things = []
    1.upto(SIZE) do |x|
      1.upto(SIZE) do |y|
         if occupied?(x,y)
           things << self[x,y]
        end
      end
    end
    things
  end
  
  def black_pieces
    pieces.select{|p| p.player.black?}
  end
  def white_pieces
    pieces.select{|p| p.player.white?}
  end
  def [](x,y)
    raise OutOfBoundsLolError if(x.to_i < 1 || y.to_i < 1 || y.to_i > SIZE || x.to_i > SIZE) 
    @places[x.to_i - 1][y.to_i - 1]
  end
  def []= (x,y, z)
    raise OutOfBoundsLolError if(x.to_i < 1 || y.to_i < 1 || y.to_i > SIZE || x.to_i > SIZE) 
    @places[x.to_i - 1][y.to_i - 1] = z
  end
  
  def is_in_bounds?(x1, y1)
    bleh = true
    bleh &= (x1 >= 1 && x1 <= VERTICAL_SIZE)
    bleh &= (y1 >= 1 && y1 <= SIZE)
    bleh
  end
  
  def occupied?(x, y)
    self[x,y] != BLANK
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
    if x < 1 || x > SIZE || y < 1 || y > SIZE
      raise OutOfBoundsLolError
    end
    self[coords[0], coords[1]] = BLANK
    self[x, y] = piece
  end
  #Following is for tactics games, not chess, for now
  #def move_piece(piece, x, y)
  #  coords = find_piece(piece)
  #  if coords
  #    #check if legal
  #    if coords[0] + x > SIZE || coords[0] + x < 1
  #      if x > 0
  #        x = SIZE - coords[0]
  #      else
  #        x = 1 - coords[0]
  #      end
  #    end
  #    if coords[1] + y > SIZE || coords[1] + y < 1
  #      if y > 0
  #        y = SIZE - coords[1]
  #      else 
  #        y = 1 - coords[1]
  #      end
  #    end
  #    #if self[coords[0]+x,coords[1]+y] == BLANK
  #    self[coords[0], coords[1]] = BLANK
  #    self[coords[0]+x, coords[1]+y] = piece
  #    #end
  #  end
  #end
  def black_king_capturable?
    black_king = black_pieces.select{|p| p.is_a?(King)}.first
    if black_king
      capturable = false
      black_king_coords = find_piece(black_king)
      white_pieces.each{|p| capturable ||= p.baseline_moves_for_board(self).include?(black_king_coords)}
      return capturable
    else
      return false
    end
  end
  def white_king_capturable?
    white_king = white_pieces.select{|p| p.is_a?(King)}.first
    if white_king
      capturable = false
      white_king_coords = find_piece(white_king)
      black_pieces.each{|p| capturable ||= p.baseline_moves_for_board(self).include?(white_king_coords)}
      return capturable
    else
      return false
    end
  end
  def representation(i,j)
    self[i,j] == BLANK ? BLANK.to_s : self[i,j].symbol
  end
  def table
    str = ""
    1.upto(SIZE) do |i|
      1.upto(SIZE) do |j|
        str += "| " + representation(j,i) + (representation(j,i) == BLANK.to_s? ? "  " : " ")
      end
      str += "|\n"
    end
    return str
  end
  

end
class OutOfBoundsLolError < Exception
  
end