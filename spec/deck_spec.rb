require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do

  describe '#initialize' do
    it "exits" do
      deck = Deck.new(@cards)
      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe '#cards' do
    it "has cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank_of_card_at'do
    it "returns the rank of cards at a given index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end



  describe '#high_ranking_cards' do
    it "has high ranking card at" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do
    it "has high ranking card at" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe "#remove_card" do
    it "remove the top card from the deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.cards).to eq([card1, card2, card3])
      deck.remove_card
      expect(deck.cards).to eq([card2, card3])
    end
  end

  describe '#add_card' do
    it "will add one card to the bottom of the deck" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      deck = Deck.new([card1, card2, card3])
      expect(deck.cards).to eq([card1, card2, card3])
      deck.add_card(card4)
      expect(deck.cards).to eq([card1,card2, card3, card4])
    end
  end

end
