class Game
  attr_accessor :players
  attr_accessor :current_player
  attr_accessor :board
  
  def initialize
    @board = Board.new
    @players = [Player.new, Player.new]
  end
end