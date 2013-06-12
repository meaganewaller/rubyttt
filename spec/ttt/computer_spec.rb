require 'spec_helper'
module TicTacToe
  describe Computer do
    let (:computer) { Computer.new('O')}
    let (:board) { Board.new }

    context "Finding Opponent" do
      it "returns X when computer is O" do
        computer.opponent('O').should == "X"
      end

      it "returns O when computer is X" do
        computer.opponent('X').should == "O"
      end
    end

    context "filled board" do
      it "returns 1 when computer wins" do
        # O | X | O
        # X | O | X
        # X | O | O
        board.place_mark(0, "O")
        board.place_mark(1, "X")
        board.place_mark(2, "O")
        board.place_mark(3, "X")
        board.place_mark(4, "O")
        board.place_mark(5, "X")
        board.place_mark(6, "X")
        board.place_mark(7, "O")
        board.place_mark(8, "O")
        computer.value(board, "O").should == 1
      end

      it "returns -1 when computer loses" do
        # X | O | X
        # O | X | O
        # O | X | X
        board.place_mark(0, "X")
        board.place_mark(1, "O")
        board.place_mark(2, "X")
        board.place_mark(3, "O")
        board.place_mark(4, "X")
        board.place_mark(5, "O")
        board.place_mark(6, "O")
        board.place_mark(7, "X")
        board.place_mark(8, "X")
        computer.value(board, "O").should == -1
      end

      it "returns 0 when there is no value" do
        # X | O | X 
        # O | X | X
        # O | X | O
        board.place_mark(0, "X")
        board.place_mark(1, "O")
        board.place_mark(2, "X")
        board.place_mark(3, "O")
        board.place_mark(4, "X")
        board.place_mark(5, "X")
        board.place_mark(6, "O")
        board.place_mark(7, "X")
        board.place_mark(8, "O")
        computer.value(board, "O").should == 0
     end
    end

    context "one space available" do
      it "takes the open space" do
        # O | X | O
        # X | O | X
        # X | X |
        board.place_mark(0, "O")
        board.place_mark(1, "X")
        board.place_mark(2, "O")
        board.place_mark(3, "X")
        board.place_mark(4, "O")
        board.place_mark(5, "X")
        board.place_mark(6, "X")
        board.place_mark(7, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[8].should == "O"
     end
    end

    context "two spaces available" do
      it "wins instead of block" do
        # O | X | O
        # O | X | 5
        # X | 7 | O
        board.place_mark(0, "O")
        board.place_mark(1, "X")
        board.place_mark(2, "O")
        board.place_mark(3, "O")
        board.place_mark(4, "X")
        board.place_mark(6, "X")
        board.place_mark(7, "O")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[5].should == "O"
      end
    end
  end
end
