require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do


  it "exists" do
    deck = Deck.new([card])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
    expect(@deck.suit).to eq(:diamond)
    expect(@deck.value).to eq('Queen')
    expect(@deck.rank).to eq(12)
  end
end
