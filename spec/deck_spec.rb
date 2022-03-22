require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:hearts, "Ace", 1)
    card2 = Card.new(:hearts, "Two", 2)
    cards = [card1, card2]

    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)

  end
  
end
