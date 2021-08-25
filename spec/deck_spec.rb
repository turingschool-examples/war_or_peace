require 'rspec'
require './lib/deck'

describe Deck do
  describe "#initialize" do
    it "is an instance of deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end

    it "has cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq cards
    end
  end

  describe "#rank_of_card_at" do
    it "gives rank of card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(1)).to eq 3
    end
  end

  describe "#high_ranking_cards" do
    it "picks high cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      cards2 = [card1, card3]
      deck = Deck.new(cards)
      deck2 = Deck.new(cards2)

      expect(deck.high_ranking_cards).to eq deck2.high_ranking_cards
      expect(deck.high_ranking_cards).to be_a Array
      expect(deck.high_ranking_cards.count).to eq 2
    end
  end

  describe "#percent_high_ranking" do
    it "gives percent of high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq 66.67
    end
  end

  describe "#remove_card" do
    it "removes top card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      cards2 = [card2, card3]
      deck = Deck.new(cards)
      deck2 = Deck.new(cards2)

      deck.remove_card
      expect(deck.cards).to eq deck2.cards
      expect(deck.cards).to be_an Array
      expect(deck.cards.count).to eq 2
    end
  end

  describe "add_card" do
    it "adds card to bottom" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      cards2 = [card1, card2, card3, card4]
      deck = Deck.new(cards)
      deck2 = Deck.new(cards2)

      deck.add_card(card4)
      expect(deck.cards).to eq deck2.cards
      expect(deck.cards).to be_an Array
      expect(deck.cards.count).to eq 4
    end
  end
end
