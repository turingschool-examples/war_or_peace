require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'has readable attributes'
    deck = Deck.new(cards)

    expect(deck.cards).to eq([])
  end

  it 'can add cards' do
    deck = Deck.new(cards)
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck.add_card(ca)
  end
