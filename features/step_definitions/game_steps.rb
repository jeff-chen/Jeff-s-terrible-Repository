Given /^I have a game$/ do
  $game = Game.new
  $board = $game.board
end

Given /^I have a blank game$/ do
  $game = Game.new
  $board = $game.board
  1.upto(8) do |i|
    1.upto(8) do |j|
      $board[i,j] = Board::BLANK
    end
  end
end

#Then /^the White Player be the Current Player$/ do
#  $game.current_player.should be_white
##end

Then /^the (\w+) Player should be the Current Player$/i do |color|
  $game.current_player.color.should == color + " Player"
  #pending # express the regexp above with the code you wish you had
end
When /^I move the piece at (\d+), (\d+) right (\d+) spaces and up (\d+) space$/ do |x1, x2, d1, d2|
  piece = $board[x1.to_i, x2.to_i]
  raise "Lol wtf there's no piece there!" if piece == Board::BLANK
  $game.make_move(piece, d1.to_i, -(d2.to_i))
end
When /^I make a white piece at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Piece.new($game.white_player), x, y)
end
When /^I make a black piece at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Piece.new($game.black_player), x, y)
end

When /^I make a white vulpix at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Vulpix.new($game.white_player), x, y)
end

When /^I make a black pawn at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Pawn.new($game.black_player), x, y)
end
When /^I make a white pawn at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Pawn.new($game.white_player), x, y)
end
When /^I make a black vulpix at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Vulpix.new($game.black_player), x, y)
end
When /^I make a black bishop at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Bishop.new($game.black_player), x, y)
end
When /^I make a black rook at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Rook.new($game.black_player), x, y)
end
When /^I make a white rook at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Rook.new($game.white_player), x, y)
end
When /^I make a black king at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(King.new($game.black_player), x, y)
end
When /^I make a black knight at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Knight.new($game.black_player), x, y)
end

When /^I make a black queen at (\d+), (\d+)$/i do |x, y|
  piece = $board.add_piece(Queen.new($game.black_player), x, y)
end

When /^I move the piece at (\d+), (\d+) left (\d+) spaces and down (\d+) space$/ do |x1, x2, d1, d2|
  piece = $board[x1.to_i, x2.to_i]
  raise "Lol wtf there's no piece there!" if piece == Board::BLANK
  $board.move_piece(piece, -(d1.to_i), d2.to_i)
end
Then /^the king for black should be capturable$/ do
  $board.should be_black_king_capturable # express the regexp above with the code you wish you had
end
Then /^the king for black should not be capturable$/ do
  $board.should_not be_black_king_capturable # express the regexp above with the code you wish you had
end