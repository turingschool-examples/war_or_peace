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

  it "has readable cards" do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it "can rank cards" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(1)).to eq(3)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it "can display high ranking cards" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "can find the percentage of high ranking cards" do
    @deck.remove_card
    deck_2 = Deck.new([@card1, @card2, @card1, @card1])

    expect(@deck.percent_high_ranking).to eq(50.0)
    expect(deck_2.percent_high_ranking).to eq(75.0)
  end

  it "can remove the top card" do
    expect(@deck.remove_card).to eq(@card1)
  end

  it "can add a card to the bottom" do
    @deck.remove_card
    @deck.add_card(@card1)

    expect(@deck.cards).to eq([@card2, @card3, @card1])
  end
end
