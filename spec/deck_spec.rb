require 'rspec'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do
  it "exists" do
    deck = Deck.new()

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect

  end

  it "has readable attributes" do

  end
