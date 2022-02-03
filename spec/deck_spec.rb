require 'Rspec'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([card1, card2, card3])

    expect(deck).to_be_an_instance_of(Deck)
  end
  
end
