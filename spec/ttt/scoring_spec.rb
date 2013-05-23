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

    it 'knows if there is a winner' do
      scoring = Scoring.new
      board = Board.new
      board.place_mark(1, "X")
      board.place_mark(4, "X")
      board.place_mark(7, "X")
      scoring.winner?(board).should == true
    end

  end
end
