require 'rspec'
require './lib/deck'
require './lib/deck'

describe Deck do
  it "exists" do
    deck = Deck.new('cards')

    expect(deck).to be_an_instance_of(Deck)
  end

  it "lists cards in the deck" do
    cards = ["card1", "card2", "card3"]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(["card1", "card2", "card3"])
  end

  it "returns the rank of the card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
  end

  it "lists high ranking cards in deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "returns percentage of high cards in deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(2 / 3)
  end

  it "removes top card from the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
  end

  it "adds one card to bottom of deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    card4 = Card.new(:club, '5', 5)

    expect(deck.add_card(card4)).to eq([card1, card2, card3, card4])
  end
end
