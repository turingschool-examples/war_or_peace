require 'rspec'
require './lib/deck'

describe Deck do
  describe "#initialize" do
    before(:each) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @card4 = Card.new(:club, '5', 5)
    end
  it 'exists' do
    cards = [@card1, @card2, @card3, @card4]
    deck = Deck.new(cards)
    expect(deck).to be_a(Deck)
  end
  it "contains an array" do
    cards = [@card1, @card2, @card3, @card4]
    deck = Deck.new(cards)
    expect(deck.cards).to be_an Array
  end
  it "has individual card attributes inside the array" do
    cards = [@card1, @card2, @card3, @card4]
    deck = Deck.new(cards)
    expect(deck.cards[0].suit).to eq :diamond
  end
end
  describe "#rank_of_card_at" do
    it "returns the rank of card at given index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3, card4]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "returns nil if no card is found" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)

      cards = [card1, card2]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(2)).to eq(nil)
    end
    describe "#high_ranking_cards" do
      it "finds the high ranking cards in a given deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        cards = [card1, card2, card3, card4]
        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card1, card3])
      end
    end
    describe "#percent_high_ranking" do
      it "gives the correct percentage of high ranking cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        card5 = Card.new(:club, 'King', 13)

        cards = [card1, card2, card3, card4, card5]
        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(60.0)
      end
    end
    describe "#remove_card" do
      it "removes first card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        card5 = Card.new(:club, 'King', 13)

        cards = [card1, card2, card3, card4, card5]
        deck = Deck.new(cards)
        deck.remove_card

        expect(deck.cards).to eq([card2, card3, card4, card5])
      end
    end
    describe "#add_card" do
      it "adds specified card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        card5 = Card.new(:club, 'King', 13)

        cards = [card1, card2, card3, card4]
        deck = Deck.new(cards)
        deck.add_card(card5)

        expect(deck.cards).to include(card5)
      end
    end
  end
end
