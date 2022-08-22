require 'rspec'
require './lib/card'
require 'deck'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  it "has no cards when created" do
    deck = Deck.new
    expect(deck.cards?).to be_empty
  end

   it "Can have a card in a deck" do
      deck = Deck.new
      card = Card.new(:heart, 'Jack', 11)

      deck.new_deck(card)
      expect(deck.cards?.count).to eq (1)


   end
end
