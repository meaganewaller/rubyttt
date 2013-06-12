class Input
  def message
    @message ||= []
  end
end


Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = TicTacToe::Game.new
  
end

Then(/^I should be greeted$/) do
  game = TicTacToe::Game.new
end
