require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'has an array of cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank_of_card_at' do
    it 'returns the rank of a card at the given index' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
    end
  end

  describe 'high_ranking_cards' do
    it 'returns an array of high rank cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe 'percent_high_ranking' do
    it 'tells the percentage of high ranking cards in a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe 'add_card or remove_card' do
    it 'can add a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      card4 = Card.new(:club, '5', 5)

      deck.add_card(card4)

      expect(deck.cards).to eq([card1, card2, card3, card4])
    end

    it 'can remove a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      deck.remove_card

      expect(deck.cards).to eq([card2, card3])
    end
  end
end
