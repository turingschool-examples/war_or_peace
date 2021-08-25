require 'rspec'
require './lib/card'

describe Card do
  xit "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  xit "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end
