require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new;

    expect(deck).to be_an_instance_of(Deck)
  end

  it "adds cards from array to deck" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it "checks rank of card" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    cards = [card1, card2]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(11)
    expect(deck.rank_of_card_at(1)).to eq(2)

  end

  it "prints array of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to include(card1, card3)
  end

  it "checks percentage of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "removes first card" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.remove_card).not_to include(card1)
  end

  it "adds card to bottom of deck" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '9', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.add_card(card4)).to include(card1, card2, card3, card4)
  end
end
