require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
deck = Deck.new(cards)
player = Player.new('Clarisa', deck)

RSpec.describe Player do
  it 'creates new player' do
    expect(player).to be_an_instance_of(Player)
  end

  it 'determines if player has lost' do
    expect(player.has_lost?).to eq(false)
  end

end

# require 'pry'; binding.pry
# 0
