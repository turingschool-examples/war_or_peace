require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before (:each)do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Three', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has an array" do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

describe 'Instance Methods' do
  it 'Index location of card and returns rank' do

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end
  it 'Returns high ranking cards [11 and up]' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end
  it 'Shows percent of Rank 11 up' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end
  it 'Removes a Card' do
    @deck.remove_card
    expect(@deck.cards).to eq([@card2, @card3])
    @deck.remove_card
    expect(@deck.cards).to eq([@card3])
  end
  it 'Adds a Card' do
      @deck.add_card(@card4)
      expect(@deck.cards).to eq([@card1, @card2, @card3, @card4])
    end
  end
end
