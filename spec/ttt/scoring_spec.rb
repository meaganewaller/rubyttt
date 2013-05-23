require 'spec_helper'
module TicTacToe
  describe Scoring do

    it 'knows when the board is not empty' do
      scoring = Scoring.new
      board = Board.new
      scoring.is_board_empty?(board).should == true
    end


  end
end
