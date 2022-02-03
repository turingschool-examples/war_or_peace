require 'rspec'
require './lib/card'
require './lib/deck'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
deck = Deck.new(cards)
# big_cards = deck.high_ranking_cards

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

end
