require 'rspec'
require './lib/deck.rb'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is an instance of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_a Deck
    end
  end

  describe '#rank_of_card_at' do
    it 'shows the rank of the card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq 12
      expect(deck.rank_of_card_at(2)).to eq 14
    end
  end
  describe '#high_ranking_cards' do
    it 'return an array of cards ranking 11 or above' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards). to be_an Array
    end
  end

  describe "#remove_card" do
    it 'can remove a card from top of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq 
  end
end
end
