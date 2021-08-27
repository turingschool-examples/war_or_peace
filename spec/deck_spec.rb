require 'rspec'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new('Deck 1')

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'it has cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.cards).to be_an Array
    expect(deck.cards[0]).to eq card1
    expect(deck.cards[0]).to be_an_instance_of(Card)

  end

  xit 'has a rank' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

  end


end
