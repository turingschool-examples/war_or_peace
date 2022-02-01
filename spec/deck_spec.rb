require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before(:each) do
    @card2 = Card.new(:spade, '3', 3)
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new (@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has elements within the instance array" do
    expected = @cards
    expect(@deck.cards).to eq(expected)
  end

  it 'can return the rank of the card at the given index' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'can create an array of only the high ranking cards' do
    expected = [@card1, @card3]
    expect(@deck.high_ranking_cards).to eq(expected)
  end
end
