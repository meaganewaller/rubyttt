require 'spec_helper'
module TicTacToe
  describe Scoring do

    it 'knows when the board is empty' do
      scoring = Scoring.new
      board = Board.new
      scoring.is_board_empty?(board).should == true
    end

    it 'knows when the board is not empty' do
      scoring = Scoring.new
      board = Board.new
      board.place_mark(1, "X")
      scoring.is_board_empty?(board).should == false
    end

  end
end
