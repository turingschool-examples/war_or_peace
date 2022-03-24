require 'rspec'
#require './lib/card'
require './lib/deck'
RSpec.describe Card do
  it "exists" do
    skip
    card = Card.new(:diamond, 'Queen', 12)
    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    skip
    card = Card.new(:diamond, 'Queen', 12)
    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  it "reads the cards" do
     #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
  end
end

RSpec.describe Deck do
  
  it "tells you what rank it is" do
     #skip
    cards = [:card1, :card2, :card3]
  end

  it "tells you if the card is high ranking"
end
