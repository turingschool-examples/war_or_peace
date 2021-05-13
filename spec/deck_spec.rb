require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Kind', 13)
    @card3 = Card.new(:diamond, 'Nine', 9)
    @deck = Deck.new([@card1, @card2, @card3])
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
  end
    it 'Returns high ranking cards [11 and up]' do
      expect(@deck.percent_high_ranking).to eq(@card1, @card2)
    end
    xit 'Shows percent of Rank 11 up' do
      expect(@deck.percent_high_ranking).to eq(66)
    end
    xit 'Removes a Card' do
    end
  # xit 'Adds a Card' do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #
  #   deck.add_card(card1)
  #   expect(@deck.cards.count).to eq(1)
  # end
  end
end
