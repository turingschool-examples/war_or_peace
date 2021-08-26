require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(12)

    expect(deck).to be_an_instance_of(Deck)
  end

=begin
  it "has a low rank" do
    deck = Deck.new(12)

    expect(deck).to
  end
=end
end
