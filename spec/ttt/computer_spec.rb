require 'spec_helper'
module TicTacToe
  describe Computer do
    let(:computer) { Computer.new('O') }
    let(:board) { Board.new }

    context "Finding Opponent" do
      it "returns X when computer is O" do
          computer.opponent("X").should == "O"
      end

      it "returns O when computer is X" do
          computer.opponent("O").should == "X"
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

      it "returns 0 when there is no winner" do
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
        board.place_mark(8, "O")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[5].should == "O"
      end

      it "blocks opponent from winning" do
        # O | X | X
        # O |   | X 
        # X | O | 
        board.place_mark(0, "O")
        board.place_mark(1, "X")
        board.place_mark(2, "X")
        board.place_mark(3, "O")
        board.place_mark(5, "X")
        board.place_mark(6, "X")
        board.place_mark(7, "O")
        board.place_mark(computer.make_move(board), "O")
        print board.print_board
        board.spaces[4].should == "O"
      end

      it "picks a space when the outcome is a tie" do
        # X | O |X
        # X | O |
        # O | X |
        board.place_mark(0, "X")
        board.place_mark(1, "O")
        board.place_mark(2, "X")
        board.place_mark(3, "X")
        board.place_mark(4, "O")
        board.place_mark(6, "O")
        board.place_mark(7, "X")
        board.place_mark(computer.make_move(board), "O")
        print board.print_board
        board.spaces[5].should == "O"
      end
    end

    context "three spaces available" do
      it "blocks opponent from winning" do
        #   |   | O
        # X | X | O
        # O |   | X
        board.place_mark(2, "O")
        board.place_mark(3, "X")
        board.place_mark(4, "X")
        board.place_mark(5, "O")
        board.place_mark(6, "O")
        board.place_mark(8, "X")
        board.place_mark(computer.make_move(board), "O")
        print board.print_board
        board.spaces[0].should == "O"
      end

      it "wins instead of blocking" do
        # O | O | 
        # X | X |
        # O | X |
        board.place_mark(0, "O")
        board.place_mark(1, "O")
        board.place_mark(3, "X")
        board.place_mark(4, "X")
        board.place_mark(6, "O")
        board.place_mark(7, "X")
        board.place_mark(computer.make_move(board), "O")
        print board.print_board
        board.spaces[2].should == "O"
      end
    end

    context "4 available spaces" do
      # O | X | O 
      # 3 | X | 5
      # O | 7 | 8
      it "wins instead of blocks" do
        board.place_mark(0, "O")
        board.place_mark(1, "X")
        board.place_mark(2, "O")
        board.place_mark(4, "X")
        board.place_mark(6, "O")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[3].should == "O"
      end

      it "blocks opponents winning move" do
        # X | X | O
        # 3 | 4 | 5
        # O | 7 | X
        board.place_mark(0, "X")
        board.place_mark(1, "X")
        board.place_mark(2, "O")
        board.place_mark(8, "X")
        board.place_mark(6, "O")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[4].should == "O"
      end
    end

    context "five available spaces" do
      it "blocks opponent from winning" do
        # O | 1 | 2
        # 3 | X | X
        # 6 | 7 | O
        board.place_mark(0, "O")
        board.place_mark(4, "X")
        board.place_mark(5, "X")
        board.place_mark(8, "O")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[3].should == "O"
      end

      it "wins when possible" do
        # O | O | 2
        # 3 | X | 5
        # 6 | 7 | X
        board.place_mark(0, "O")
        board.place_mark(1, "O")
        board.place_mark(4, "X")
        board.place_mark(8, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[2].should == "O"
      end
    end

    context "six available spaces" do
      it "blocks opponent from winning" do
        # X | 1 | 2
        # 3 | O | 5
        # X | 7 | 8
        board.place_mark(0, "X")
        board.place_mark(4, "O")
        board.place_mark(6, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[3].should == "O"
      end

      it "picks best possible move" do
        # X | 1 | 2
        # 3 | O | 5
        # 6 | X | 8
        board.place_mark(0, "O")
        board.place_mark(4, "O")
        board.place_mark(7, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces[1].should == "O"
      end
    end

    context "seven available spaces" do
      it "picks best possible move" do
        # O | 1 | 2
        # 3 | X | 5
        # 6 | 7 | 8
        board.place_mark(0, "O")
        board.place_mark(4, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces.should_not include([1 || 3 || 5 || 7])
      end
    end

    context "eight available spaces" do
      it "picks best first move" do
        # X | 1 | 2 
        # 3 | 4 | 5
        # 6 | 7 | 8
        board.place_mark(0, "X")
        board.place_mark(computer.make_move(board), "O")
        board.spaces.should_not include([1 || 4 || 5 || 7 || 3])
      end
    end
  end
end
