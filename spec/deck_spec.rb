require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Card do
  it 'card1 exists' do
    card1 = Card.new(:diamond, 'Queen', 12)

    expect(card1).to be_a(Card)
  end

  it 'card2 exists' do
    card2 = Card.new(:spade, '3', 3)

    expect(card2).to be_a(Card)
  end

  it 'card3 exists' do
    card3 = Card.new(:heart, 'Ace', 14)

    expect(card3).to be_a(Card)
  end
end

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_a(Deck)
  end

  it 'has cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it 'checks rank of cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it 'checks for high ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "gives percentage of high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end
end
