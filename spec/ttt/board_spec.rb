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

      it 'can reset the board' do
        board.place_mark(0, "X")
        board.place_mark(1, "X")
        board.place_mark(2, "X")
        board.place_mark(3, "X")
        board.get(0).should == "X"
        board.get(1).should == "X"
        board.get(2).should == "X"
        board.get(3).should == "X"
        board.reset.should == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      end

      it 'knows the current game state' do
        board.place_mark(0, "X")
        board.place_mark(4, "X")
        board.place_mark(8, "O")
        board.current_game_state.should == ["X", " ", " ", " ", "X", " ", " ", " ", "O"]
      end
  end
end
