Given /^I have a game$/ do
  $game = Game.new
  $board = $game.board
end

#Then /^the White Player be the Current Player$/ do
#  $game.current_player.should be_white
##end

Then /^the (\w+) Player should be the Current Player$/i do |color|
  $game.current_player.color.should == color + " Player"
  #pending # express the regexp above with the code you wish you had
end