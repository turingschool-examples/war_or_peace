require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  it "has an array of cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards_array = [card1, card2, card3]
    deck = Deck.new(cards_array)
# binding.pry
    expect(deck.cards_array).to eq(cards_array)
  end 
end 