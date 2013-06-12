module TicTacToe
  class Computer
    attr_accessor :marker

    def initialize(marker)
      @marker = marker
    end

    def make_move(board)
      best_move(board)
      return @best_move
    end

    def opponent(type)
      type == "X" ? "O" : "X"
    end

    def value(board, player)
      if board.winner == player
        return 1
      elsif board.winner == opponent(player)
        return -1
      else
        return 0
      end
    end

    def winner?(board, player)
      0 != value(board, player)
    end

    def best_move(board)
      test_board = board.dup
      negamax(test_board, @marker, 1)
    end

    def negamax(board, player, depth)
      return value(board, player)  if winner?(board, player)

      best_rank = -999
      opponent = opponent(player)

      board.available_spaces.each do |space|
        test_board = board.dup
        test_board.place_mark(space, player)
        rank = -negamax(test_board, opponent, depth + 1)
        if rank > best_rank
          best_rank = rank
          @best_move = space
        end
      end
      return best_rank
    end
  end
end
