Given /^I am setting up pieces$/i do 
  $pieces = []
end

When /^I have a piece at (\d+), (\d+)$/i do |x, y|
  $pieces << Piece.new(x, y)
end

When /^I make a vulpix at (\d+), (\d+)$/ do |arg1, arg2|
  $pieces << Vulpix.new # express the regexp above with the code you wish you had
  $board.add_piece($pieces.last, arg1, arg2)
end

When /^I move the vulpix at (\d+), (\d+) right (\d+) spaces and down (\d+) space$/ do |x1, x2, d1, d2|
  piece = $board[x1.to_i, x2.to_i]
  raise "Lol wtf there's no piece there!" if piece == Board::BLANK
  $board.move_piece(piece, d1.to_i, d2.to_i)
end

When /^I move the vulpix at (\d+), (\d+) left (\d+) spaces and down (\d+) space$/ do |x1, x2, d1, d2|
  piece = $board[x1.to_i, x2.to_i]
  raise "Lol wtf there's no piece there!" if piece == Board::BLANK
  $board.move_piece(piece, -(d1.to_i), d2.to_i)
end

When /^I move the piece at (\d+), (\d+) right (\d+) spaces and up (\d+) space$/ do |x1, x2, d1, d2|
  piece = $board[x1.to_i, x2.to_i]
  raise "Lol wtf there's no piece there!" if piece == Board::BLANK
  $board.move_piece(piece, d1.to_i, -(d2.to_i))
end