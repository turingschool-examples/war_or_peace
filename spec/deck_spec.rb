require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([1,2,3])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has 'cards' as a readable attribute" do
    deck = Deck.new([1,2,3])

    expect(deck.cards).to eq([1,2,3])
  end

  it "returns the rank of a card" do
    deck = Deck.new([1,2,3])

    expect(deck.rank_of_card_at(0)).to eq(1)
  end

  it "returns an array of high ranking cards (11 or higher)" do

    deck = Deck.new([1,3,6,9,12,13,14])
    expect(deck.high_ranking_cards).to eq([12,13,14])
  end

  # it "returns the percent of high ranking cards" do
  #
  #   deck = Deck.new([1,12,15])
  #   expect(deck.percent_high_ranking).to eq(66.67)
  # end
end
