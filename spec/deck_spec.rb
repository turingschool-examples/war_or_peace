require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    it 'exists and has attributes' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      
      expect(deck).to be_a(Deck)
      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank_of_card_at()' do
    it 'returns the rank of that card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      deck.rank_of_card_at(0)
      deck.rank_of_card_at(2)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do
    it 'returns cards in the deck that have a rank of 11 or above' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to include(card1, card3)
    end
  end
end



  
