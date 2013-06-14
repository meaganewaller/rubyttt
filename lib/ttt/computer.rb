#module TicTacToe
#  class Computer
#    attr_accessor :marker
#
#    def initialize(marker)
#      @marker = marker
#    end
#
#    def opponent
#      @marker == "X" ? "O" : "X"
#    end
#  end  
#end

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
        #puts "Player: #{player} Space: #{space}"
        board.place_mark(space, player)
        rank = -negamax(board, opponent, depth + 1)
        #puts "Player: #{player} Space: #{space} - Rank: #{rank}"
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

