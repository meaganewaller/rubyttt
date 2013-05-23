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

      it 'can undo a mark in a space' do
        board.place_mark(0, "X")
        board.get(0).should == "X"
        board.undo(0)
        board.get(0).should == " "
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

      it 'knows the game state when there are moves' do
        board.place_mark(0, "X")
        board.place_mark(1, "X")
        board.current_game_state.should == ["X", "X", " ", " ", " ", " ", " ", " ", " "]
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
          board.rows.should == [["X", " ", " "],
                               [" ", "X", " "],
                               [" ", " ", "O"]]
        end

        it 'has columns' do
          board.columns.should == [["X", " ", " "],
                                   [" ", "X", " "],
                                   [" ", " ", "O"]]
        end

        it 'has a diagonal from top left to bottom right' do
          board.diagonal_ltr.should == ["X", "X", "O"]
        end

        it 'has a diagonal from top right to bottom left' do
          board.diagonal_rtl.should == [" ", "X", " "]
        end

        it 'has winning solutions' do
          board.winning_solutions.should == [["X", " ", " "],
                                             [" ", "X", " "],
                                             [" ", " ", "O"],
                                             ["X", " ", " "],
                                             [" ", "X", " "],
                                             [" ", " ", "O"],
                                             ["X", "X", "O"],
                                             [" ", "X", " "]]
        end
      end

  end
end
