require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
it 'exists' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards_arr = [card1, card2, card3]

    deck = Deck.new(cards_arr)
    expect(cards_arr).to eq([card1, card2, card3])
  end
end