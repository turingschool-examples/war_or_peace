require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  before(:each ) do
    @card = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @cards = [@card, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
  end

describe "high_ranking_cards" do
  it "lists all high ranking cards" do
    expect(@deck.high_ranking_cards.length).to eq(2)
  end
end

describe "#percent_high_ranking" do
  it "gives percentage of high ranking cards" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end
end

describe "#remove_card" do
  it "removes card from top of deck" do
    expect(@deck.remove_card).to eq(@card)
  end
end

describe "#add_card" do
  it "adds card to bottom of deck" do
    @deck.add_card(@card4)
    expect(@deck.cards.length).to eq(4)
  end
end

end
