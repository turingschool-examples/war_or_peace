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

   it "can have a card in a deck" do
      deck = Deck.new
      card = Card.new(:heart, 'Jack', 11)

      deck.new_card(card)
      expect(deck.cards?.count).to eq (1)
   end

   it "can have multiple cars in a deck" do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck.new_card(card1)
    deck.new_card(card2)
    deck.new_card(card3)

    expect(deck.cards?.count).to eq(3)
   end






end
