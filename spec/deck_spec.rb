require './lib/card'
require './lib/deck'
require 'rspec'
require 'pry'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

  it 'contains an array of cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it 'returns an array of high ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.high_ranking_cards).to eq([card1, card3])

  end

  it 'returns the percentage of cards that are high ranking' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)

  end

  it 'can remove the top card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    removed_card = deck.remove_card

    expect(deck.cards).to eq([card2, card3])
    expect(removed_card).to eq(card1)

  end

  it 'can add a card to the bottom' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    cards = [card1, card2]
    deck = Deck.new(cards)
    expect(deck.cards).to eq([card1, card2])

    card3 = Card.new(:heart, 'Ace', 14)
    deck.add_card(card3)
    expect(deck.cards).to eq([card1, card2, card3])
  end

end
