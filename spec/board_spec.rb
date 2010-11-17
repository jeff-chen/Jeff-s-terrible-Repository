require File.dirname(__FILE__) + '/spec_helper'

describe Board do
  before do
    @board = Board.new
  end
  
  it 'should have 8 by 8 squares' do
    1.upto(8) do |i|
      1.upto(8) do |j|
        lambda{
          @board[1,1]
        }.should_not raise_error(OutOfBoundsLolError)
      end
    end
  end
  
  it 'should not be defined at 1,9' do
    lambda{@board[1,9]}.should raise_error(OutOfBoundsLolError)
  end
  
  it 'should not be defined at 9,1' do
    lambda{@board[9,1]}.should raise_error(OutOfBoundsLolError)
  end
  
  it 'should not be define outside 8 by 8' do
    1.upto(8) do |i|
      lambda{@board[0,i]}.should raise_error(OutOfBoundsLolError)
      lambda{@board[i,0]}.should raise_error(OutOfBoundsLolError)
      lambda{@board[i,9]}.should raise_error(OutOfBoundsLolError)
      lambda{@board[9,i]}.should raise_error(OutOfBoundsLolError)
    end
    
  end
  
  it 'should be able to assign things to a piece' do
    @board[1,1].should == 0
    @board[2,2].should == 0
    @board[1,1] = 3
    @board[1,1].should == 3
    @board[2,2].should == 0
  end
  
  it 'should not assign things to invalid squares' do
    1.upto(8) do |i|
      lambda{@board[0,i] = 3}.should raise_error(OutOfBoundsLolError)
      lambda{@board[i,0] = 3}.should raise_error(OutOfBoundsLolError)
      lambda{@board[i,9] = 3}.should raise_error(OutOfBoundsLolError)
      lambda{@board[9,i] = 3}.should raise_error(OutOfBoundsLolError)
    end
  end
  
  it 'should be able to create a piece at a square' do
    @piece = Piece.new
    @board.add_piece(@piece, 1, 1)
    @board[1,1].should == @piece
  end
  
  it 'should return the coordinates of a piece' do
    @piece = Piece.new
    @board.add_piece(@piece, 3, 4)
    @board.find_piece(@piece).should == [3,4]
  end
  
  it 'should return nil for a piece that is not there' do
    @piece = Piece.new
    @board.find_piece(@piece).should == nil
  end
  
  it 'should move a piece from a square to another' do
    @piece = Piece.new
    @board.add_piece(@piece, 1, 1)
    @board[1,1].should == @piece
    @board[1,2].should == 0
    @board.move_piece(@piece, 0, 1)
    @board[1,1].should == 0
    @board[1,2].should == @piece
  end
  it 'should not move another piece into a piece' do
    @piece1, @piece2 = Piece.new, Piece.new
    @board.add_piece(@piece1, 1, 1)
    @board.add_piece(@piece2, 1, 2)
    @board.move_piece(@piece1, 0, 1)
    @board[1,1].should == @piece1
    @board[1,2].should == @piece2
  end
  it 'should not move a piece out of bounds to the right' do
    @piece = Piece.new
    @board.add_piece(@piece, 7, 1)
    @board.move_piece(@piece, 2, 0)
    @board[8,1].should == @piece
  end
  it 'should not move a piece out of bounds to the up' do
    @piece = Piece.new
    @board.add_piece(@piece, 1, 2)
    @board.move_piece(@piece, 0, -1)
    @board[1,1].should == @piece
  end
  it 'should not move a piece out of bounds to the down' do
    @piece = Piece.new
    @board.add_piece(@piece, 1, 7)
    @board.move_piece(@piece, 0, 2)
    @board[1,8].should == @piece
  end
  it 'should not move a piece out of bounds to the left' do
    @piece = Piece.new
    @board.add_piece(@piece, 2, 8)
    @board.move_piece(@piece, -2, 0)
    @board[1,8].should == @piece
  end
  it 'should move a piece to the furthest bound' do
    @piece = Piece.new
    @board.add_piece(@piece, 1, 7)
    @board.move_piece(@piece, 0, 2)
    @board[1,7].should == 0
    @board[1,8].should == @piece
    
  end
end