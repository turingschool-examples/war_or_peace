require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  before(:each ) do
    @card = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card, @card2, @card3]
    @deck = Deck.new(@cards)
  end
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)

    expect(deck.card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end
