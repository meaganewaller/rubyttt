require 'spec_helper'
module TicTacToe
  describe Game do
    let(:input) { double('input').as_null_object }
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new }

    context "starting a new game" do
      before :each do
        game.stub(:input) { "X" }
      end

      it "gets the users marker" do
        game.current_player.should == "X"
      end

      it "returns opposite marker for computer" do
        game.get_computer_marker.should == "O"
      end
    end

      describe ".make_move" do
        it "puts players move to board" do
          game.make_move(8)
          game.board.spaces[8].should == "X"
        end
      end

      describe ".end_turn" do
        it "calls for player switch" do
          game.should_receive(:switch_players)
          game.end_turn
        end
      end

      describe ".is_game_over?" do
        it "returns true if theres a winner" do
          game.make_move(0)
          game.make_move(1)
          game.make_move(2)
          game.board.is_game_over?.should == true
        end

        it "returns false if there is not a winner" do
          game.board.is_game_over?.should == false
        end
      end

      describe ".switch_players" do
        context "When 'X' is the current player" do
          it "makes O the current player" do
            game.make_move(0)
            game.end_turn
            game.current_player.should == "O"
          end
        end

        context "When 'O' is the current player" do
          it "makes X the current player" do
            game.make_move(0)
            game.end_turn
            game.make_move(1)
            game.end_turn
            game.current_player.should == "X"
          end
        end

        context "making multiple moves" do
          it "keeps switching players without getting lost" do
            game.make_move(0)
            game.end_turn
            game.make_move(1)
            game.end_turn
            game.make_move(2)
            game.end_turn
            game.make_move(3)
            game.end_turn
            game.current_player.should == "X"
          end
        end

        
      end
  end
end
