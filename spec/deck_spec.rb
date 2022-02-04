require 'Rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  it "can return high ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)

  cards = [card1, card2, card3]
  deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to be_an_instance_of(Array)
      expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "can determine percentage of high ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)

  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  expect(deck.percent_high_ranking). to eq(66.67)
  end

  it "can remove the first card from the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect (cards.delete_at(0))
  end

  it "can add a card to the deck" do
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)

    cards = [card2, card3]
    deck = Deck.new(cards)
    expect cards << card4
  end 

end
