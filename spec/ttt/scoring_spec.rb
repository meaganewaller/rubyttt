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

    it 'knows that markers need to be the same to win' do
      board.place_mark(1, "X")
      board.place_mark(4, "X")
      board.place_mark(7, "O")
      scoring.winner?(board).should == false
    end

    it 'knows when X is the winner' do
      board.place_mark(1, "X")
      board.place_mark(4, "X")
      board.place_mark(7, "X")
      scoring.winning_player(board).should == "X"
    end

    it 'knows when O is the winner' do
      board.place_mark(0, "O")
      board.place_mark(1, "O")
      board.place_mark(2, "O")
      scoring.winning_player(board).should == "O"
    end

    it 'can find a win in a row' do
      board.place_mark(0, "O")
      board.place_mark(1, "O")
      board.place_mark(2, "O")
      scoring.winner?(board).should == true
    end

    it 'can find a win in a column' do
      board.place_mark(0, "X")
      board.place_mark(3, "X")
      board.place_mark(6, "X")
      scoring.winner?(board).should == true
    end

    it 'can find a win diagonal left to right' do
      board.place_mark(0, "X")
      board.place_mark(4, "X")
      board.place_mark(8, "X")
      scoring.winner?(board).should == true
    end

    it 'can find a win diagonal from right to left' do
      board.place_mark(2, "O")
      board.place_mark(4, "O")
      board.place_mark(6, "O")
      scoring.winner?(board).should == true
    end

    it 'knows when the game is tied' do
      board.place_mark(0, "O")
      board.place_mark(1, "X")
      board.place_mark(2, "O")
      board.place_mark(3, "X")
      board.place_mark(4, "X")
      board.place_mark(5, "O")
      board.place_mark(6, "X")
      board.place_mark(7, "O")
      board.place_mark(8, "X")
      scoring.is_game_tied?(board).should == true
    end

  end
end
