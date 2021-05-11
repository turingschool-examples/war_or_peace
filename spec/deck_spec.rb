require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'

RSpec.describe Deck do
  describe '#initialize' do
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe 'attributes' do
    it "has readable attributes" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card1,card2,card3])
    end
  end

  describe 'rank_of_card_at' do
    it "returns rank of card at specified index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe 'high_ranking_cards' do
    it "returns array of all high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1,card3])
    end
  end

  describe 'percent_high_ranking' do
    it "returns the percentage of high ranking cards as float" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe 'remove_card' do
    it "returns top card aka index 0 in deck, removing it from cards array" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq([card2,card3])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end

  describe 'add_card' do
    it "can add card to cards array" do
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      expect(deck.cards).to eq([card2,card3])
      deck.add_card(card4)
      expect(deck.cards).to eq([card2,card3,card4])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end
end
