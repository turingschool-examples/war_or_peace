require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "#initialize" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
  end

  it "#has a card rank" do
    deck.rank_of_card_at(0)
    expect
  end

  it "#has high ranking cards" do
    deck.high_ranking_cards
    expect(@high_ranking_cards).to eq (card1, card3)
  end

  it "#has a percentage of high ranking cards" do
    deck.percent_high_ranking
    expect(@percent_high_ranking).to eq 66.67%
  end
end
