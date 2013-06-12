module TicTacToe
  class Game
    attr_accessor :computer, :player_mark, :current_player, :opponent, :board

    def initialize
      @io = InputOutput.new
      @computer_marker = ""
      @current_player = "X"
      @opponent = "O"
      @board = Board.new
    end

    def input
      @io.input
    end

    def game_options
      @io.output "Welcome to Tic Tac Toe"
      @io.output "Are There (1) or (2) Players?"
      answer = input
      until answer == "1" || answer == "2"
        answer = input
      end
      if answer == "1"
        @computer_marker = get_computer_marker
        @computer = Computer.new(@computer_marker)
      end
      start
    end

    def get_computer_marker
      @io.output "Do you want to be (X) or (O)?"
      choice = input.upcase
      until choice == "X" || choice == "O"
        @io.output "Invalid Player Type"
        choice = input.upcase
      end
      return choice == "X" ? "O" : "X"
    end

    def start
      until @board.is_game_over?
        start_turn
        space = get_move
        make_move(space)
        end_turn
      end
    end

    def start_turn
      display_board
      @io.output "It's #{@current_player}s Turn"
    end

    def get_move
      move = ""
      until @board.available_spaces.include?(move)
        @io.outprint "->"
        move = get_input
        display_board
      end
      return move
    end

    def get_input
      return @computer.make_move(@board) if @computer_marker == @current_player
      input.to_i
    end

    def display_board
      system('clear')
      @io.output @board.print_board
    end

    def make_move(space)
      @board.place_mark(space, @current_player)
    end

    def end_turn
      display_board
      check_game_state
      switch_players
      start_turn
    end

    def check_game_state
      if winner
        game_over
      elsif tied?
        tie
      end
    end

    def winner
      @board.winner
    end

    def tied?
      @board.is_game_tied?
    end

    def tie
      @io.output "The game is tied"
      play_again
    end

    def game_over
      @io.output "Player #{@board.winner} Wins!"
      @io.output "Game Over."
      play_again
    end

    def play_again
      @io.output "Do you want to play again? (y/n)"
      if input =~ /[Yy]/
        system('clear')
        g = Game.new
        g.game_options
      else
        @io.output "Thanks for playing!"
        exit(0)
      end
    end

    def switch_players
      @current_player, @opponent = @opponent, @current_player
    end
  end
end
