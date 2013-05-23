module TicTacToe
  class Scoring

    def initialize
      board = Board.new
    end

    def is_board_empty?(board)
      return true if board.available_spaces.count == 9
      return false 
    end

    def winner?(board)
      winner = false
      board.winning_solutions.each do |sol|
        if sol.uniq.length == 1 && sol[0] != " "
          winner = true
        end
      end
      winner
    end

    def winning_player(board)
      board.winning_solutions.each do |sol|
        if sol.uniq.length == 1 && sol[0] != " "
          return sol[0]
        end
      end
    end

    def is_game_tied?(board)
      return true if board.available_spaces.count == 0 && winner?(board) == false
      return false
    end
  end
end

