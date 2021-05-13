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

  it 'the deck exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'obtains cards' do
    expect(@deck.cards).to eq(@cards)
  end

  it 'has rank_of_card_at' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'is the high_ranking_cards' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'has percent_high_ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end
end
