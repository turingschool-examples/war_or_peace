require './lib/card'
require './lib/deck'


Rspec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)

    expect(card1).to be_an_instance_of(Deck)
  end

Rspec.describe Deck do
  it "exists" do
    card2 = Card.new(:spade, '3', 3)

    expect(card2).to be_an_instance_of(Deck)
  end

Rspec.describe Deck do
  it "exists" do
    card3 = Card.new(:heart, 'Ace', 14)

    expect(card3).to be_an_instance_of(Deck)
  end

Rspec.describe Deck do
  it "cards array" do

    cards = [card1, card2, card3]

    expect(deck.cards).to eq()

end
