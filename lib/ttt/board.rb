module TicTacToe
  class Board
    attr_accessor :spaces

    def initialize
      @spaces = Array.new(9) {" "}
    end

    def get(space)
      @spaces[space]
    end

    def place_mark(space, mark)
      @spaces[space] = mark
    end

    def undo(space)
      @spaces[space] = " "
    end

    def reset
      initialize
    end

    def current_game_state
      @spaces.map {|x| x}
    end

    def is_space_empty?(space)
      return true if @spaces[space] == " "
      return false
    end

    def available_spaces
      available_spaces = @spaces.each_with_index.select { |i, space| i == " " }
      available_spaces = available_spaces.map { |i| i[1] }
      available_spaces
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

    def winning_solutions
      winning_solutions = []
      rows.map { |row| winning_solutions << row }
      columns.map { |col| winning_solutions << col }
      winning_solutions << diagonal_ltr
      winning_solutions << diagonal_rtl
    end

  end
end
