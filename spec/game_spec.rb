require File.dirname(__FILE__) + '/spec_helper'

describe Game do
  before do
    @game = Game.new
  end
  
  it 'has two players' do
    @game.players.size.should == 2
  end
  it 'has a white and black player' do
    @game.players[0].should be_white
    @game.players[1].should be_black
  end
  it 'always has a current player' do
    @game.current_player.should == @game.players[0]
  end
  it 'sets the default player to white' do
    @game.current_player.should be_white
  end
  it 'has a board' do
    @game.board.should_not be_nil
  end
  it 'alternates the player from white to black' do
    @game.alternate_player
    @game.current_player.should be_black
  end
  it 'alternates the player from black to white' do
    @game.alternate_player
    @game.current_player.should be_black
  end
  

end