#require './lib/card'

RSpec.describe Card do
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

require '.lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'has array available' do
    deck = Deck.new
  end
end
