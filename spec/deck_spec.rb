require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  describe 'initialize' do
    it 'deck is an instance of a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      card3 = Card.new(:heart, 'Ace', 14)    
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck).to be_a(Deck)
      expect(card1).to be_a(Card)
      expect(deck.cards).to eq(cards)
    end
  end
  
  describe 'rank_of_card_at' do
    it 'ranks the card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)   
      cards = [card1, card2]
      deck = Deck.new(cards)
    
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
    end
  end
end