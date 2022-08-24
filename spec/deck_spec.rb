require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "#initialize" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
  end
end
