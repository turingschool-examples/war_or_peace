require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'
RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq(cards)
  end
  describe "#rank_of_card_at" do
    it "return rank of card at a given index position" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end
  describe "#high_ranking_cards" do
    it "return cards with ranks higher than 11" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      high_rank = [card1, card3]

      expect(deck.high_ranking_cards).to eq(high_rank)
    end
  end
  describe  "#percent_high_ranking" do
    it "return percentage of cards that are high" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      high_rank = [card1, card3]
      binding.pry
      expect(deck.percent_high_ranking).to eq(66.66)
      binding.pry
    end
  end
  describe "#remove_card" do
    it "remove card from deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq([card2, card3])
    end
  end
  describe "#add_card" do
    it "add card to bottom of deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)

      expect(deck.cards).to eq(card1, card2, card4)
      expect(deck.high_ranking_cards).to eq(card1)
      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end
end
