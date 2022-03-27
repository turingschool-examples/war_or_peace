require "rspec"
require "./lib/card"
require "./lib/deck"

describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end
  it "has readable attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end
  describe "#rank_of_card_at" do
    it "ranks other cards" do
       card1 = Card.new(:diamond, 'Queen', 12)
       card2 = Card.new(:spade, '3', 3)
       card3 = Card.new(:heart, 'Ace', 14)
       cards = [card1, card2, card3]
       deck = Deck.new(cards)
       deck.rank_of_card_at(0)
       deck.rank_of_card_at(2)
       expect(deck.rank_of_card_at(0)).to eq(12)
       expect(deck.rank_of_card_at(2)).to eq(14)
     end
  end
  describe "#high_ranking_cards" do
    it "collects high ranked cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards[0,2]).to eq(cards)
    end
  describe "#percent_high_ranking" do
    it "shows percentage of high rank cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(66.67)
      expect(deck.cards).to eq(66.67)
    end
  end
  describe "#add_card" do
    it "adds new card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.add_card(card4)
      expect(deck.cards[3]).to eq(card4)
      expect(deck.cards.count).to eq(4)
    end
  end
  describe "#remove_card" do
    it "removes a card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq(card1)
    end
end
end
end
