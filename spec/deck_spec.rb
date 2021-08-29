require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'


RSpec.describe Deck do
  it "exists" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it "can get the rank of card at an index location" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.rank_of_cards_at(0)).to eq(12)
    expect(deck.rank_of_cards_at(2)).to eq(14)

  end

  it "can list the high ranking cards" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card_1, card_3])
  end

  it "can tell percentage of high ranking cards in deck" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to be_between(66, 67)
  end

  it "can add a card to the deck" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    card_4 = Card.new(:club, '5', 5)

    expect(deck.add_card(card_4)).to eq([card_1, card_2, card_3, card_4])
  end

  it "can remove a card from the deck" do
    card_1 = Card.new(:diamond, "Queen", 12)
    card_2 = Card.new(:spade, "3", 3)
    card_3 = Card.new(:heart, "Ace", 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq([card_2, card_3])

  end

end
