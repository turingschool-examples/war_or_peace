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

  it 'can get rank of card at index' do
    expect(@deck.rank_of_card_at(0)).to eq(12)
  end

  it 'can get high ranking cards' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'can get percent high ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove card' do
    expect(@deck.remove_card).to eq(@card1)
  end

  it 'can add card' do
    card4 = Card.new(:club, '5', 5)

    expect(@deck.add_card(card4)).to eq(@deck.cards << card4)
  end
end