require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new
    expect(deck).to be_an_instance_of(Deck)
  end
  
  xit 'has an array of cards' do
    deck = Deck.new
    expect(deck.cards).to eq([])
  end
  
  it 'has a method to return the rank of a card
  at an index position passed as an argument' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.rank_of_card_at(0)).to eq(14)
    expect(deck.rank_of_card_at(2)).to eq(8)
    
  end
end