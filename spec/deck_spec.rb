require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has a rank_of_card_at" do
    cards = []

    @deck.add_card(@card1)
    @deck.add_card(@card2)
    @deck.add_card(@card3)

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(1)).to eq(3)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it "has high_ranking_cards" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

end
