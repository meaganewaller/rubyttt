require 'spec_helper'
module TicTacToe
  describe Scoring do
    let(:board) { Board.new }
    let(:scoring) { Scoring.new }

    it 'knows when the board is empty' do
      scoring.is_board_empty?(board).should == true
    end

    it 'knows when the board is not empty' do
      board.place_mark(1, "X")
      scoring.is_board_empty?(board).should == false
    end

    it 'knows if there is a winner' do
      board.place_mark(1, "X")
      board.place_mark(4, "X")
      board.place_mark(7, "X")
      scoring.winner?(board).should == true
    end

    it 'knows when there is not a winner' do
      scoring.winner?(board).should == false
    end

  end
end
