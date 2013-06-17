module TicTacToe
  class Computer
    attr_accessor :marker

    def initialize(marker)
      @marker = marker
    end

    def make_move(board)
      if board.available_spaces.count == 9
        (0..8).to_a.sample
      else
        best_move(board)
        return @best_move
      end
    end

    def opponent(marker)
      marker == "X" ? "O" : "X"
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
      negamax(board, @marker, 1)
    end 

    def negamax(board, player, depth)
      if board.is_game_over?
        return value(board, player)
      else

      best_rank = -9999
      opponent = opponent(player)

      board.available_spaces.each do |space|
        board.place_mark(space, player)
        rank = -negamax(board, opponent, depth + 1)
        board.undo(space)
        if rank > best_rank
          best_rank = rank
          @best_move = space if depth == 1
        end
      end
      return best_rank
      end
    end
  end
end

