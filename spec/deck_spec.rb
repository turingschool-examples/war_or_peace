require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:hearts, "Ace", 14)
    card2 = Card.new(:hearts, "Two", 2)
    cards = [card1, card2]

    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has high ranking cards at" do
    card1 = Card.new(:hearts, "Ace", 14)
    card2 = Card.new(:hearts, "Two", 2)
    card3 = Card.new(:hearts, "Queen", 12)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([14, 12])
  end

  it "checks precentage of high ranking cards" do
    card1 = Card.new(:hearts, "Ace", 14)
    card2 = Card.new(:hearts, "Two", 2)
    card3 = Card.new(:hearts, "Queen", 12)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

end
