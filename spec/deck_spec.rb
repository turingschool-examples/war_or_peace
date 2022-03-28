require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  it "has a way to read cards" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  it "has a way to read rank of a card" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "has a way to get the higher ranking cards above rank 11" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.high_ranking_cards).to eq([card1, card3])
    expect(deck.percent_high_ranking_cards).to eq(66.67) # 66.7 value pulled from interaction pattern
  end

  it "has to remove a card" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card
    expect(deck.cards).to eq([card2, card3])
  end

  it "has to add card" do
    card1 = Card.new(:diamond, 'Queen', 12)

    card2 = Card.new(:spade, '3', 3)

    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    card4 = Card.new(:club, '5', 5) # defines new card4 variable which stores 3 different card array elements
    deck.add_card(card4) # adds the defined card4 array to deck object as a card with an array of card elements
    expect(deck.cards).to eq([card1, card2, card3, card4]) # prints all card arrays from the deck class
  end

end
