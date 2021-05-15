require 'rspec'
require './lib/deck'

describe Deck do
  it "exists" do
    deck = Deck.new('cards')

    expect(deck).to be_an_instance_of(Deck)
  end

  it "lists cards in the deck" do
    cards = ["card1", "card2", "card3"]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(["card1", "card2", "card3"])
  end
end
