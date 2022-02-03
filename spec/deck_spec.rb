require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq(cards)
  end

  it "can return the rank of a card" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  # it "cards are in an array and contains correct cards" do
  #   card1 = Card.new(:diamond, "Queen", 12)
  #   card2 = Card.new(:spade, "Ace", 14)
  #   card3 = Card.new(:heart, "10", 10)
  #
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #
  #   expect(deck.cards).to be_a(Array)
  #   expect(deck.cards.count).to eq(3)
  #   expect(deck.cards[0]).to eq(card1)
  #   expect(deck.cards[1]).to eq(card2)
  #   expect(deck.cards[2]).to eq(card3)
  # end

  it "can sort high ranking cards" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to be_a Array
    expect(deck.high_ranking_cards.count).to eq(2)
    expect(deck.high_ranking_cards[0].rank).to eq(12)
    expect(deck.high_ranking_cards[1].rank).to eq(14)
  end

  it "can calculate percent of high ranking cards" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)

    deck.remove_card
    expect(deck.percent_high_ranking).to eq(50.0)

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    expect(deck.percent_high_ranking).to eq(33.33)
  end

  it "can remove a card" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(3)
    deck.remove_card
    expect(deck.cards.count).to eq(2)
    deck.remove_card
    expect(deck.cards.count).to eq(1)
    deck.remove_card
    expect(deck.cards.count).to eq(0)
  end

  it "can add a card" do
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(3)
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    expect(deck.cards.count).to eq(4)
    expect(deck.cards[3]).to eq(card4)
  end
end
