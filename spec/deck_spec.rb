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

  it 'can return the #percent_high_ranking cards' do
    expect(@deck.percent_high_ranking).to eq((2/3))
  end

  it 'can #remove_card from top of deck' do
    expect(@deck.remove_card).to eq(@card1)
    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(1/2)
  end

  it 'can add a card to the bottom of the dec and verify changes in array' do
    @card4 = Card.new(:club, '5', 5)
    expected = [@card1, @card2, @card3, @card4]

    expect(@deck.add_card(@card4)).to eq([@card1, @card2, @card3, @card4])
    expect(@deck.cards).to eq(expected)
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    expect(@deck.percent_high_ranking).to eq(2/4)
  end

end
