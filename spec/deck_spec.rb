require 'rspec'
require './lib/deck'
require './lib/card'


RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @card4 = Card.new(:club, '5', 5)
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "returns the deck of cards" do
    expect(@deck.cards).to eq(@cards)
  end

  it "return the rank of that card" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it "eleven and above" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "return the percentage of cards that are high ranking" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "remove the top card from the deck" do
    expect(@deck.remove_card).to eq(@card1)
    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50.0)
  end

  it "add one card to the bottom" do
    @deck.remove_card
    @deck.add_card(@card4)
    expect(@deck.cards).to eq([@card2, @card3, @card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end
