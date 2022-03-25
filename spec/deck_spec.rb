require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require 'pry'

RSpec.describe Deck do

  context "my tests" do

    it "existsand has cards" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_an_instance_of(Deck)
      expect(deck.cards).to eq([card1, card2, card3])
    end

    it "can read the rank of card" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(13)
      expect(deck.rank_of_card_at(1)).to eq(3)
      expect(deck.rank_of_card_at(2)).to eq(8)
    end

    it "can tell the suit of a card at a index position" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.suit_of_card_at(0)).to eq(:club)
      expect(deck.suit_of_card_at(1)).to eq(:spade)
      expect(deck.suit_of_card_at(2)).to eq(:diamond)
    end

    it "has high ranking cards" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1])
    end


    it "shows percentage of high ranking cards in a deck" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(33.33)
    end

    it "can remove a card from deck" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
      deck.remove_card
      expect(deck.cards).to eq([card2, card3])
    end

    it "can add a card from deck" do
      card1 = Card.new(:club, 'King', 13)
      card2 = Card.new(:spade, 'Three', 3)
      card3 = Card.new(:diamond, 'Eight', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
      card4 =Card.new(:heart, 'Queen', 12)
      deck.add_card(card4)
      expect(deck.cards).to eq([card1, card2, card3, card4])
    end

  end

  context "interaction pattern" do

    it "the deck is an array" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card1, card2, card3])
    end

    it "can tell the rank of a card at a index position" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "has some high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "can remove a card from deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
      deck.remove_card
      expect(deck.cards).to eq([card2, card3])
    end

    it "can add cards to a deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
      card4 =Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(deck.cards).to eq([card1, card2, card3, card4])
    end
  end
end
