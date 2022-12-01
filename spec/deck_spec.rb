require './lib/card'
require './lib/deck'

describe Deck do

  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14) 

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_a(Deck)
  end

  it 'has readable attributes' do
    expect(@deck.cards).to eq(@cards)
  end

end