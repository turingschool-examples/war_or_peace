require 'Rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

  end
end
