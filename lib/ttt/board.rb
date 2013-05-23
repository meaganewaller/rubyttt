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

    def reset
      initialize
    end

  end
end

