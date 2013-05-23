module TicTacToe
  class Scoring

    def initialize
      board = Board.new
    end

    def is_board_empty?(board)
      return true if board.available_spaces.count == 9
      return false 
    end
  end
end
