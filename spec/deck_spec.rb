require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([1,2,3])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has 'cards' as a readable attribute" do
    deck = Deck.new([1,2,3])

    expect(deck.cards).to eq([1,2,3])

    require 'pry';binding.pry

  end


end
