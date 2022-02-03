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



RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(card_array)

    expect(deck).to be_an_instance_of(Deck)
  end





end
