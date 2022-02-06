require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new("cards")

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    deck = Deck.new("cards")

    expect(deck.cards).to eq("cards")
  end

end
