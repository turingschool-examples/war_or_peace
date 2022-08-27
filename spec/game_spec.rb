# require 'rspec'
# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'
# require './lib/game'

# RSpec.describe Turn do
#   before :each do
#     @deck1 = Deck.new([])
#     @deck2 = Deck.new([])
#     @player1 = Player.new("Megan", @deck1)
#     @player2 = Player.new("Aurora", @deck2)
#     @turn = Turn.new(@player1, @player2)
#     @game = Game.new
#   end

#   it 'exists' do
#     expect(@game).to be_an_instance_of(Game)
#   end
# end