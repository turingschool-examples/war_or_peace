require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  describe '#initialize' do
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank_of_card_at' do
    it "has cards with readable ranks" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do
    it "can discern which cards have high ranks" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#calculate_percent_high_ranking' do
    it "can determine the percentage of high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      deck.high_ranking_cards
      expect(deck.percent_high_ranking).to eq(66.7)
    end
  end

  describe '#remove_card' do
    it "can remove cards from the deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      deck.remove_card
      expect(deck.cards).to eq([card2, card3])
    end
  end

  describe '#add_card' do
    it "can add cards to the deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      deck.remove_card
      expect(deck.cards).to eq([card2, card3])

      card4 = Card.new(:club, '5', 5)

      deck.add_card(card4)
      expect(deck.cards).to eq([card2, card3, card4])
    end
  end
end
