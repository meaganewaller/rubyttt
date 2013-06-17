module TicTacToe
  class InputOutput
    
    def input
      gets.chomp
    end

    def output(message)
      puts message
    end

    def outprint(message)
      print message
    end

    #def printmagenta(message)
     # print "\033[35m#{message}\0c33[m"
    #end
    
    #def printcyan(message)
     # print "\033[36m#{message}\0c33[m"
    #end

  end
end
