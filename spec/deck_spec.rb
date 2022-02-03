require 'rspec'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:club, '5', 5)
    card2 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2])
    expect(deck).to be_an_instance_of(Deck)
  end

  it "has 'cards' as a readable attribute" do
    card1 = Card.new(:club, '5', 5)
    deck = Deck.new([card1])
    expect(deck.cards).to eq([card1])
  end

  it "returns the rank of a card" do
    card1 = Card.new(:club, '5', 5)
    card2 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2])
    expect(deck.rank_of_card_at(0)).to eq(5)
  end

  it "returns an array of high ranking cards (11 or higher)" do
    card1 = Card.new(:club, 'Ace', 14)
    card2 = Card.new(:heart, 'Queen', 12)
    card3 = Card.new(:club, 'Jack', 11)
    card4 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card1, card2, card3])
  end

  it "returns the percent of high ranking cards" do

    card1 = Card.new(:club, 'Ace', 14)
    card2 = Card.new(:heart, 'Queen', 12)
    card3 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2, card3])
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "removes the first card from the deck" do
    card1 = Card.new(:club, 'Ace', 14)
    card2 = Card.new(:heart, 'Queen', 12)
    card3 = Card.new(:club, 'Jack', 11)
    card4 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.remove_card).to eq([card2, card3, card4])
  end

  it "adds a card to the end of the deck" do
    card1 = Card.new(:club, 'Ace', 14)
    card2 = Card.new(:heart, 'Queen', 12)
    card3 = Card.new(:heart, '3', 3)
    deck = Deck.new([card1, card2, card3])
    card4 = Card.new(:heart, 'King', 13)
    expect(deck.add_card(card4)).to eq([card1, card2, card3, card4])
  end

end
