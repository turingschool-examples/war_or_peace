require './lib/card'
require './lib/deck'


RSpec.describe Deck do
  describe '#initialize' do

    it 'is a deck of cards' do
      deck_of_cards = Deck.new

      expect(deck_of_cards).to_be_an_instance_of(Deck)

      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

    deck_of_cards = Deck.new(cards)

  end
end
