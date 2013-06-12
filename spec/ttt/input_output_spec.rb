require 'spec_helper'
module TicTacToe
  describe InputOutput do
    let(:io) { InputOutput.new }

    it 'can get input' do
      io.stub(:input).and_return('test')
    end

    it 'can output messages' do
      io.output("Testing")
    end

    it 'can print a message' do
      io.outprint("Testing")
    end

  end
end
