require 'spec_helper'

module TicTacToe
  describe Board do
    let(:board) { Board.new }

      it 'starts with a blank board' do
        board.spaces.should == [0, 1, 2, 3, 4, 5, 6, 7, 8]
      end

      it 'can retrieve a space' do
        board.get(7).should == 7 
      end

      it 'can place a mark in a space' do
        board.place_mark(7, "X")
      end

      it 'can read a mark placed in a space' do
        board.place_mark(1, "X")
        board.get(1).should == "X"
      end

      it 'can undo a mark' do
        board.place_mark(1, "X")
        board.undo(1).should == 1
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
        board.reset.should == [0, 1, 2, 3, 4, 5, 6, 7, 8]
      end

      it 'knows the current game state' do
        board.place_mark(0, "X")
        board.place_mark(4, "X")
        board.place_mark(8, "O")
        board.current_game_state.should == ["X", 1, 2, 3, "X", 5, 6, 7, "O"]
      end

      it 'knows the game state when there are moves' do
        board.place_mark(0, "X")
        board.place_mark(1, "X")
        board.current_game_state.should == ["X", "X", 2, 3, 4, 5, 6, 7, 8]
      end

      it 'knows if a space is empty' do
        board.is_space_empty?(7).should == true
      end

      it 'knows if a space is not empty' do
        board.place_mark(4, "X")
        board.is_space_empty?(4).should == false
      end

      it 'knows what spaces are available' do
        board.place_mark(0, "X")
        board.place_mark(1, "X")
        board.place_mark(8, "X")
        board.available_spaces.should == [2,3,4,5,6,7] 
      end

      describe "Board Set Up" do
        before(:each) do
          board.place_mark(0, "X")
          board.place_mark(4, "X")
          board.place_mark(8, "O")
        end

        it 'has rows' do
          board.rows.should == [["X", 1, 2],
                               [3, "X", 5],
                               [6, 7, "O"]]
        end

        it 'has columns' do
          board.columns.should == [["X", 3, 6],
                                   [1, "X", 7],
                                   [2, 5, "O"]]
        end

        it 'has a diagonal from top left to bottom right' do
          board.diagonal_ltr.should == ["X", "X", "O"]
        end

        it 'has a diagonal from top right to bottom left' do
          board.diagonal_rtl.should == [2, "X", 6]
        end

        it 'prints the board' do
          output = <<-BOARD

       X | 1 | 2
      ---+---+---
       3 | X | 5
      ---+---+---
       6 | 7 | O\n
          BOARD
            board.print_board.should == output
        end


        it 'has winning solutions' do
          board.winning_solutions.should == [["X", 1, 2],
                                             [3, "X", 5],
                                             [6, 7, "O"],
                                             ["X", 3, 6],
                                             [1, "X", 7],
                                             [2, 5, "O"],
                                             ["X", "X", "O"],
                                             [2, "X", 6]]
        end
      end

        it 'knows if the board is empty' do
          board.is_board_empty?.should == true
        end

        it 'knows when the game is tied' do
          # O | X | O
          # X | X | O
          # X | O | X
          board.place_mark(0, "O")
          board.place_mark(1, "X")
          board.place_mark(2, "O")
          board.place_mark(3, "X")
          board.place_mark(4, "X")
          board.place_mark(5, "O")
          board.place_mark(6, "X")
          board.place_mark(7, "O")
          board.place_mark(8, "X")
          board.is_game_tied?.should == true
        end

        it "knows when the game isnt tied" do
          board.is_game_tied?.should == false
        end

        it "knows when there is a winner" do
          # X | X | X
          #   |   | 
          #   |   |
          board.place_mark(0, "X")
          board.place_mark(1, "X")
          board.place_mark(2, "X")
          board.winning_player?("X").should == true
        end

        it "knows when there is not a winner" do
          board.winning_player?("O").should == false
          board.winning_player?("X").should == false
        end

        it "knows when X is the winner" do
          board.place_mark(0, "X")
          board.place_mark(1, "X")
          board.place_mark(2, "X")
          board.winner.should == "X"
        end

        it "knows when O is the winner" do
          board.place_mark(0, "O")
          board.place_mark(1, "O")
          board.place_mark(2, "O")
          board.winner.should == "O"
        end

        it "knows when there isn't a winner" do
          board.winner.should == nil
        end

        it "knows when the game is over" do
          board.is_game_over?.should == false
        end

        it "knows when the game is over" do
          board.place_mark(0, "X")
          board.place_mark(1, "X")
          board.place_mark(2, "X")
          board.is_game_over?.should == true
        end

      end
end

