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
      return true if @spaces[space] = " "
      return false
    end

  end
end
