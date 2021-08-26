require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is an an instance of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2=  Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '8', 8)

      cards = ['card1', 'card2', 'card3']

      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end
    it "has readable attributes" do

      card1 = Card.new(:diamond, 'Queen', 12)
      card2=  Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(cards).to be_an Array
      expect(cards[0]).to be_a Card
    end
  end
end
