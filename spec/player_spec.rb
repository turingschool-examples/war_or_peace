# require 'rspec'
# require './lib/card'
# require './lib/deck'
# require './lib/player'
#
# RSpec.describe Player do
#
#     before :each do
#       @card1 = Card.new(:diamond, 'Queen', 12)
#       @card2 = Card.new(:spade, '3', 3)
#       @card3 = Card.new(:heart, 'Ace', 14)
#       @deck = Deck.new([@card1, @card2, @card3])
#       @player = Player.new('Clarisa', @deck)
#     end
#
#     it 'has a new player' do
#       expect(@player).to be_an_instance_of(Player)
#       expect(@player.name).to eq('Clarisa')
#
#     end
#
#     it 'has deck of cards' do
#       expect(@player.deck).to be_an_instance_of(Deck)
#     end
#
#     it 'able to start playing' do
#       expect(@player.lost?).to eq false
#     end
#
#     it 'has lost?' do
#     @player.deck.remove_card
#     expect(@player.lost?).to be false
#     @player.deck.remove_card
#     expect(@player.lost?).to be false
#     @player.deck.remove_card
#     expect(@player.lost?).to be true
#   end
# end
