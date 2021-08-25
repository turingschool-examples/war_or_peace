require 'rspec'
require './lib/deck'

describe Deck do
  describe "#initialize" do
    it "is an instance of deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end
  end
end
