require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do

  describe '#initialize' do
    it 'exists' do
      deck = Deck.new(['card_1', 'card_2', 'card_3'])
      expect(deck).to be_an_instance_of(Deck)
    end

    it 'has an attribute' do
      deck = Deck.new(['card_1', 'card_2', 'card_3'])
      expect(deck.cards).to eq(['card_1', 'card_2', 'card_3'])
    end
  end

  describe '#rank_of_card_at' do
    it 'checks rank of card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.rank_of_card_at(1)
      expect(deck.rank_of_card_at(1)).to eq(3)
    end
  end

  describe '#high_ranking_cards' do
    it 'returns high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do
    it 'returns percentage' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      binding.pry
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do
    it 'removes top card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq(card1)
    end
  end

  describe '#add_card' do
    it 'adds a card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(cards).to include(card4)
    end
  end


end
