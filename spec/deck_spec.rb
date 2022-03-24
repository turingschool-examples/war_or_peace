require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_a Deck
    end
  end

  describe '#remove_card' do
    it 'removes a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      expect(deck).to eq [card1, card2]
    end
  end

  describe '#high_ranking_cards' do
    it 'interrogates high ranking cards into an array' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards
      expect(high_rank).to eq [card1, card3]
    end
  end

end

