require 'pry'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @card4 = Card.new(:club, '5', 5)
    # let(:) {()}
  end

  it 'exists' do
    expect(@deck).to be_a(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it 'returns card rank' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it 'returns a high ranking card' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'returns percent of high ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it 'removes the top card' do
    expect(@deck.remove_card).to eq(@card1)
  end

  it 'adds a card to the bottom' do
    @deck.remove_card
    @cards = [@card2, @card3]
    @deck.add_card(@card4)
    # expect(@deck.cards).to eq([@card2, @card3])
    # expect(@deck.add_card(@card4)).to eq([@card2, @card3, @card4])
    expect(@deck.cards).to eq([@card2, @card3, @card4])
  end
end
