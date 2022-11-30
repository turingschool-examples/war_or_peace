require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'
RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(cards = Card.new(:diamond, 'Queen', 12))

    expect(deck).to be_an_instance_of(Deck)
  end

  it "should return cards in deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq (cards)
    # expect(card.suit).to eq(:diamond)
    # expect(card.value).to eq('Queen')
    # expect(card.rank).to eq(12)
  end

  it "should return rank of a specific card in the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq (cards)
    expect(deck.rank_of_card_at(0)).to eq (12)
    expect(deck.rank_of_card_at(2)).to eq (14)
    expect(deck.cards).to eq (cards)
  end

  it "should return high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end
end
