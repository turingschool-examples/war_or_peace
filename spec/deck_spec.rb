require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([])

    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
   deck = Deck.new([])

   expect(deck.cards).to eq([])
  end

  it "has rank_of_card_at" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq 12
  end

  it "has high_ranking_cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq [card1, card3]
  end

  it "has percent_high_ranking" do
    #this method will return the percentage of cards that are high ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq 66.67
  end

  it "has remove_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
    deck.remove_card
    expect(deck.cards).to eq ([card2, card3])
  end

  it "has add_card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
    deck.add_card(card4)
    expect(deck.cards).to eq ([card1, card2, card3, card4])
  end
end
