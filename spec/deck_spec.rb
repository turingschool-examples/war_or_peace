require 'rspec'
require './lib/card'
require './lib/deck'

#Setup variables for tests
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heard, 'Ace', 14)
cards = [card1, card2, card3]

RSpec.describe Deck do
  it "exists" do

    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    deck = Deck.new(cards)
    expect(deck.rank_of_card_at(0)).to eq(12)
  end

  it "has cards" do
    deck = Deck.new(cards)
    cards_in_deck = (deck.cards).length
    expect(cards_in_deck).to eq(3)
  end
end
