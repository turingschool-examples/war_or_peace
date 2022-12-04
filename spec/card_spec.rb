require 'rspec'
require './lib/card'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamonds, 'Queen', 12)

    expect(card).to be_a(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamonds, 'Queen', 12)

    expect(card.suit).to eq(:diamonds)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end
