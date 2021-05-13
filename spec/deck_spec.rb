require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  context 'Attributes' do
    it 'is a deck' do
      deck = Deck.new([])
      expect(deck).to be_an_instance_of(Deck)
    end

    it 'has cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq [card1, card2, card3]
    end
  end

  context 'Methods' do
    it 'returns card rank by index position' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_cards_at(0)).to eq(12)
      expect(deck.rank_of_cards_at(2)).to eq(14)
    end

    it 'returns high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq [card1, card3]
    end
  end
end
