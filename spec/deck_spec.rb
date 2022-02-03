require 'rspec'
require './lib/card'
require './lib/deck'
# ADD MORE TESTS BEFORE THIS FIRST ONE TO TEST MORE ENTRIES IN THE ITERATION PATTERN
RSpec.describe Deck do
  it "deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "Deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards

    expect(deck).to be_an_instance_of(Deck)
  end

  it "rank of card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.rank_of_card_at(0)
    deck.rank_of_card_at(2)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.cards
    deck.high_ranking_cards

    expect(deck.high_ranking_cards).to eq([card1, card3])

  end



end
