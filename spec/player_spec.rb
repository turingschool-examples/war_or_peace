require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new ([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

it 'player instance exists and is an instance of Player class' do
  binding.pry
  expect(@player).to be_a(Player)
end



end
