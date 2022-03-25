require 'rspec'
require './lib/card'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:heart, 'Jack', 11)
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:heart, 'Jack', 11)
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    expect(card.suit).to eq(:heart)
    expect(card.value).to eq('Jack')
    expect(card.rank).to eq(11)
  end
end
