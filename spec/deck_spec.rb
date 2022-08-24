require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck).to be_an_instance_of(Deck)
    end
    it 'has cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end
  end
  describe '#methods' do
    it 'can get the rank of a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)

    end
    it 'can get the high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      high_cards = [card1, card3]

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq(high_cards)
    end
    it 'can get the % of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      high_cards = [card1, card3]

      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(66.67)
    end
    it 'can remove a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.remove_card).to eq(card1)
    end
  end
end
