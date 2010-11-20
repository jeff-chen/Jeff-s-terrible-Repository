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
  
  def take_turn(x1, y1, x2, y2)
    piece = @board[x1, y1]
    if piece != Board::BLANK && piece.legal_moves_for_board(@board).include?([x2, y2])
      if(piece.is_a?(King))
        piece.moved = true
        if x2.to_i - x1.to_i == 2
          rook = @board[x1.to_i + 3, y1]
          @board.move_piece(rook, x1.to_i + 1, y2)
        elsif x2.to_i - x1.to_i == -2
          rook = @board[x1.to_i - 4, y1]
          @board.move_piece(rook, x1.to_i - 1, y2)
        end
      end
      @board.move_piece(piece, x2, y2)
      
      alternate_player
    end
  end
  
  def check_winner
    moves = @current_player.pieces(@board).map{|x| x.legal_moves_for_board(@board)}
    if moves.flatten.empty?
      if @current_player.white?
        if @board.white_king_capturable?
          return other_player
        else
          return "Stalemate!"
        end
      end
      if @current_player.black?
        if @board.black_king_capturable?
          return other_player
        else
          return "Stalemate!"
        end
      end
      #stalemate 
    end
    return nil
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
    @current_player = other_player
  end
  
  def other_player
    if @current_player == white_player
      black_player
    else
      white_player
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