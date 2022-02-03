require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
  @card1 = Card.new(:diamond, 'Queen', 12)
  @card2 = Card.new(:spade, '3', 3)
  @card3 = Card.new(:heart, 'Ace', 14)
  @cards = [@card1, @card2, @card3]
  @deck = Deck.new(@cards)
  # let(:) {()}
  end

  it 'exists' do
    expect(@deck).to be_a(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it 'returns a high ranking card' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end
end
