#%w(piece board vulpix player game bishop pawn rook knight queen king).each do |name|
#  require File.dirname(__FILE__) + '/' + name
#end
#@game = Game.new
#@p1 = @game.white_player
#@p2 = @game.black_player
#
#while true
#  puts "It is " + @game.current_player.color + "'s turn"
#  puts @game.board.table
#  puts "Which piece to move? Enter x then y"
#  x = gets
#  y = gets
#  piece = @game.board[x,y]
#  raise "no piece found" if !piece
#  puts "Which direction to move? Enter direction of x then direction of y"
#  deltax = gets
#  deltay = gets
#  @game.make_move(piece, deltax.to_i, deltay.to_i)
#end