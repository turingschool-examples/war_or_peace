require 'rspec'
require './lib/card'
require './lib/deck'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
card4 = Card.new(:club, '5', 5)
deck = Deck.new(cards)


RSpec.describe Deck do
  it "holds cards" do
    expect(deck).to be_an_instance_of(Deck)
  end

  it "checks the rank of card at ()" do
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "shows cards" do
    expect(deck.cards).to eq(cards)
  end

  it "creates a subset of high ranking cards" do
    greater_than_eleven = [card1, card3]
    expect(deck.high_ranking_cards).to eq(greater_than_eleven)
  end

  it "calcualtes % of high ranking cards" do
    expect(deck.percent_high_ranking).to eq(2/3)
  end

  it "removes 1st card" do
    expect(deck.remove_card). to eq(card1) # shows removed cards
  end

  it "checks the remaning high ranking cards percentage" do
    expect(deck.percent_high_ranking).to eq(1/2)
  end

  it "adds a card at last" do
      expect(deck.add_card(card4)).to eq([card2, card3, card4])
  end
  it "returns a new subset of high ranking cards from current set" do
    greater_than_eleven = [card3]
    expect(deck.high_ranking_cards).to eq(greater_than_eleven)
  end

  it "checks the current high ranking cards percentage" do
    expect(deck.percent_high_ranking).to eq(1/3)
  end
end
