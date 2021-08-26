require 'rspec'
require '../lib/deck'
require '../lib/card'

RSpec.describe Deck do
  diamondQ = Card.new(:diamond, 'Queen', 12)
  heart2 = Card.new(:heart, '2', 2)
  spadeA = Card.new(:spade, 'Ace', 14)
  club5 = Card.new(:club, '5', 5)
  cards = [diamondQ, heart2, spadeA, club5]
  deck = Deck.new(cards)

  it 'exists' do
    expect(deck).to be_an_instance_of(Deck)
  end

  it 'rank of cards' do
    expect(deck).to be_an_instance_of(Deck)
    expect(deck.rank_of_card_at(0)).to be_a(Integer)
    expect(deck.rank_of_card_at(0)).to be(12)
  end

  it 'percent high ranking' do
    expect(deck.percent_high_ranking).to be(0.50)
  end
end
