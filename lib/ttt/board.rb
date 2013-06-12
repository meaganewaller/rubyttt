module TicTacToe
  class Board
    attr_accessor :spaces

    def initialize(spaces=[0,1,2,3,4,5,6,7,8] )
      @spaces = spaces
    end

    def get(space)
      @spaces[space]
    end

    def dup
      Board.new(@spaces.dup) 
    end


    def place_mark(space, mark)
      @spaces[space.to_i] = mark
    end

    def reset
      initialize
    end

    def current_game_state
      @spaces.map {|x| x}
    end

    def is_space_empty?(space)
      return true if @spaces[space.to_i].is_a?(Numeric)
      return false
    end

    def available_spaces
      @spaces.select {|x| x.is_a?(Numeric) }.compact
    end

    def rows
      [@spaces[0..2],
       @spaces[3..5],
       @spaces[6..8]]
    end

    def columns
      rows.transpose
    end

    def diagonal_ltr
      [@spaces[0], @spaces[4], @spaces[8]]
    end

    def diagonal_rtl
      [@spaces[2], @spaces[4], @spaces[6]]
    end

    def print_board
      board = <<-BOARD
       #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]}
      ---+---+---
       #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]}
      ---+---+---
       #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]}\n
       BOARD
    end

    def winning_solutions
      winning_solutions = []
      rows.map { |row| winning_solutions << row }
      columns.map { |col| winning_solutions << col }
      winning_solutions << diagonal_ltr
      winning_solutions << diagonal_rtl
    end
    
    def is_board_empty?
      return true if available_spaces.count == 9
      return false
    end

    def is_game_tied?
      return true if available_spaces.count == 0
      return false
    end

    def winning_player?(mark)
      winner = false
      winning_solutions.each do |solution|
        if solution.all? { |space| space == mark }
          winner = true
          break
        else
          winner = false
        end
      end
      return winner
    end

    def winner
      return "X" if winning_player?("X")
      return "O" if winning_player?("O")
      return nil
    end

    def is_game_over?
      return true if winner || available_spaces.count < 1
      return false
    end

  end
end
