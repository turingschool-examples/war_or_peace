require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Card do
  it 'card1 exists' do
    card1 = Card.new(:diamond, 'Queen', 12)

    expect(card1).to be_a(Card)
  end

  it 'card2 exists' do
    card2 = Card.new(:spade, '3', 3)

    expect(card2).to be_a(Card)
  end

  it 'card3 exists' do
    card3 = Card.new(:heart, 'Ace', 14)

    expect(card3).to be_a(Card)
  end
end
