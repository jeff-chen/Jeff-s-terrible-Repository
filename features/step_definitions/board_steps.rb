Given /^I have a Board$/i do
  $board = Board.new
end

Then /^It should be defined at (\d+), (\d+)$/i do |num1, num2|
  $board[num1, num2].should_not be_nil
end

Then /^It should not be defined at (\d+), (\d+)$/i do |num1, num2|
  lambda{$board[num1, num2]}.should raise_error(OutOfBoundsLolError)
end

Then /^I should see the following board:$/i do |table|
  table.hashes.each_with_index do |i, y|
    1.upto(8) do |z|
      $board.representation(z, y+1).to_s.should == i[(z).to_s].to_s
    end
  end
end

