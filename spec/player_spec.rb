require File.dirname(__FILE__) + '/spec_helper'

describe Player do
  before do
    @player = Player.new('Bob')
  end
  
  it 'has a name' do
    @player.name.should == 'Bob'
  end
  
  it 'has color constants' do
    Player::BLACK_NAME.should == "Black Player"
    Player::WHITE_NAME.should == "White Player"
  end
  
  it 'can assign the color white if the first letter of color is w' do
    @player1 = Player.new('Bob', 'w')
    @player1.should be_white
    @player1.should_not be_black
  end
  it 'can assign the color black if the first letter of color is b' do
    @player1 = Player.new('Bob', 'b')
    @player1.should be_black
    @player1.should_not be_white
  end
  
  it 'does not assign a default color' do
    @player.should_not be_black
    @player.should_not be_white
  end
  
  it 'has pieces' do
    @game = Game.new
    @player = @game.white_player
    @player.pieces(@game).size.should == 16
  end
end