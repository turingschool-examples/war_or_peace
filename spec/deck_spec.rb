require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe '#iteration 1' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_a(Deck)
      expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'can read specific card ranks' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'can id high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq([card1, card2, card3])
      expect(deck.high_ranking_cards).to eq([card1, card3])
      expect(deck.percent_high_ranking).to eq(66.67)
    end

    it 'can add cards to a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)

      expect(deck.cards).to eq([card1, card2, card3, card4])
    end

    it 'can remove cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card

      expect(deck.cards).to eq([card2, card3])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end
end
