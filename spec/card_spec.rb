require 'rspec'
require './lib/card'

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

  it 'can be a different card' do
    card = Card.new(:heart, 'Ace', 13)

    expect(card.suit).to eq(:heart)
    expect(card.value).to eq('Ace')
    expect(card.rank).to eq(13)
  end

end
