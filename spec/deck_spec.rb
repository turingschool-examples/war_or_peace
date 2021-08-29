require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do

  describe "#initialize" do
    it "is an instance of Deck" do
      card1 = Card.new(:spade, '3', 3)
      cards = [card1]
      deck = Deck.new(cards)

      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe "attr_reader" do
    it "has readable attributes" do
      card1 = Card.new(:diamonds, 'ace', 14)
      card2 = Card.new(:diamonds, 'king', 13)
      cards = [card1, card2]
      deck = Deck.new(cards)

      expect(deck.cards).to include(card1, card2)
    end
  end

  describe "#rank_of_card_at" do
    context "given 0"
      it "returns the 3rd item in the first item in the array" do
        card1 = Card.new(:spade, '3', 3)
        cards = [card1]
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(3)
      end
  end

  describe "#high_ranking_cards" do
    it "returns an array of cards rank 11 or above" do
      card1 = Card.new(:diamonds, 'ace', 14)
      card2 = Card.new(:diamonds, '2', 2)
      cards = [card1, card2]
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1])
    end
  end

  describe "#percent_high_ranking" do
    it "returns the percentage of cards that are high ranking" do
      card1 = Card.new(:diamonds, 'king', 13)
      card2 = Card.new(:diamonds, '3', 3)
      cards = [card1, card2]
      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end

  describe "#remove_card" do
    it "removes the first card in the instance object array" do
      card1 = Card.new(:diamonds, 'ace', 14)
      card2 = Card.new(:diamonds, 'king', 13)
      cards = [card1, card2]
      deck = Deck.new(cards)

      expect(deck.remove_card).to eq(card1)
    end
  end

  describe "#add_card" do
    it "adds a card object to the end of the instance object array" do
      card1 = Card.new(:diamonds, 'ace', 14)
      cards = [card1]
      deck = Deck.new(cards)
      card7 = Card.new(:diamonds, 'queen', 12)
      
      expect(deck.add_card(card7)).to include(card1,card7)
    end
  end
end
