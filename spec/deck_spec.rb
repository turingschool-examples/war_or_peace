require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "stores multiple cards" do
    expect(@deck.cards).to eq(@cards)
  end

  it "returns the values of the cards in the deck" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it "returns an array of the high ranking cards" do
    expected = [@card1, @card3]
    expect(@deck.high_ranking_cards).to eq(expected)
  end

  it "returns percent of high ranking cards in the deck" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "removes cards from the deck" do
    expect(@deck.remove_card).to eq(@card1)
    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50.0)
  end

  it "can add new cards to the deck" do
    @deck.remove_card
    @card4 = Card.new(:club, "5", 5)
    @deck.add_card(@card4)

    expect(@deck.cards).to eq([@card2, @card3, @card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end