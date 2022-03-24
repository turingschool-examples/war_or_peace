require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  before(:each ) do
    @card = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    # @card = Card.new(:diamond, 'Queen', 12)
    # @card2 = Card.new(:spade, '3', 3)
    # @card3 = Card.new(:heart, 'Ace', 14)
    # @cards = [@card, @card2, @card3]
    # @deck = Deck.new(@cards)

    # expect(@deck.rank_of_card_at(0)).to eq('Queen')
    expect(@deck.rank_of_card_at(0)).to eq(12)
  end

  it "lists all high ranking cards" do
    expect(@deck.high_ranking_cards.length).to eq(2)
  end

  it "gives percentage of high ranking cards" do
    expect(@deck.percent_high_ranking).to eq(66.6)
  end
end
