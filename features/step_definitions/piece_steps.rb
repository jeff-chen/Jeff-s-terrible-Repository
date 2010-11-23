Given /^I am setting up pieces$/i do 
  $pieces = []
end

When /^I have a piece at (\d+), (\d+)$/i do |x, y|
  $pieces << Piece.new(x, y)
end

Then /^the piece at (\d+), (\d+) should be black$/i do |x1, x2|
  piece = $board[x1.to_i, x2.to_i]
  raise "There's no piece there!" if piece == Board::BLANK
  piece.should be_black
end

Then /^the piece at (\d+), (\d+) should be white$/i do |x1, x2|
  piece = $board[x1.to_i, x2.to_i]
  raise "There's no piece there!" if piece == Board::BLANK
  piece.should be_white
end
Then /^the piece at (\d+), (\d+) should be allowed to move to (\d+), (\d+)$/ do |x1, y1, x2, y2|
  #puts $board.table
  $board[x1.to_i, y1.to_i].legal_moves_for_board($board).should include([x2.to_i, y2.to_i])
end
Then /^the piece at (\d+), (\d+) should not be allowed to move to (\d+), (\d+)$/ do |x1, y1, x2, y2|
  $board[x1.to_i, y1.to_i].legal_moves_for_board($board).should_not include([x2.to_i, y2.to_i])
end
Then /^the piece at (\d+), (\d+) should not be allowed to move anywhere$/ do |x1, y1|
  $board[x1.to_i, y1.to_i].legal_moves_for_board($board).should be_empty
end

When /^I make a piece at (\d+), (\d+)$/ do |x, y|
  $board[x.to_i, y.to_i] = Piece.new
end
