require 'rspec'
require 'pry'
require './lib/card.rb'
require './lib/deck.rb'



describe Deck do
  describe '#initialize' do
    it "is an array of cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_a Deck
    end
  end
  describe '#rank_of_card_at' do
    it "returns the rank at the given index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(12)
    end
  end
  describe '#high_ranking_cards' do
    it 'starts as an empty array' do
      high_rank_cards = []
      expect(high_rank_cards).to be_empty
    end
    it 'returns an array with high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to be_an Array
    end
  end
end
