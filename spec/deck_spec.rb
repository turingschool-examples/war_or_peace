require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exist" do
  deck.new(cards)
  expect(deck).to be_an_instance_of(Deck)
end
