class Game
  attr_accessor :players
  attr_accessor :current_player
  attr_accessor :board
  
  def initialize(player_1_name='', player_2_name='')
    @board = Board.new
    @players = [Player.new(player_1_name, 'w'), Player.new(player_2_name, 'b')]
    set_current_player(@players[0])
    initialize_board(@board, @players)
  end
  
  def set_current_player(player)
    @current_player = player
  end
  
  def make_move(piece, x, y)
    #log.update move if successful
    #check legality of move here
    
    @board.move_piece(piece, x, y)
    alternate_player
  end
  
  def white_player
    @players.select{|p| p.white?}.first
  end
  
  def black_player
    @players.select{|p| p.black?}.first
  end
  def alternate_player
    if @current_player == white_player
      @current_player = black_player
    else
      @current_player = white_player
    end
  end
  
  def initialize_board(board, players)
    positions = {King => [[5,1]], Queen => [[4,1]], Bishop => [[3,1], [6,1]], Knight => [[2,1],[7,1]],
      Rook => [[1,1],[8,1]], Pawn => [[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2]]}
    players.each do |player|
      positions.each do |p|
        p[1].each do |spot|
          if player.white?
            board.add_piece(p[0].new(player), spot[0], 9-spot[1])
          else
            board.add_piece(p[0].new(player), spot[0], spot[1])
          end
        end
      end
    end
  end
  
  
end