require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end


card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card_array = [card1, card2, card3]
deck2 = Deck.new(card_array)

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(card_array)

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'gets the card rank' do
    expect(deck2.rank_of_card_at(0)).to eq(12)
  end

  it 'shows the high ranking cards' do
    expect(deck2.high_ranking_cards).to eq([card1, card3])
  end

  it 'calcs percentage of high ranking cards' do
    expect(deck2.percent_high_ranking).to eq(66.67)
  end





end
