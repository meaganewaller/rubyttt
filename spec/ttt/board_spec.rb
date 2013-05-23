require 'spec_helper'

module TicTacToe
  describe Board do
    let(:board) { Board.new }

      it 'starts with a blank do' do
        board.spaces.should == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      end

      it 'can retrieve a space' do
        board.get(7).should == " "
      end

      it 'can place a mark in a space' do
        board.place_mark(7, "X")
      end

      it 'can read a mark placed in a space' do
        board.place_mark(1, "X")
        board.get(1).should == "X"
      end
  end
end
