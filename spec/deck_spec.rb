require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  
end