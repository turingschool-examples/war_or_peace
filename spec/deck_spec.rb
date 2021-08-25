require 'rspec'
require './lib/deck.rb'

Rspec.describe Deck do
  it "exists" do
    deck = Deck.new[]

    expect(deck).to be_empty[] 
  end
end
