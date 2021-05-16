require 'rspec'
require '../lib/card'
require '../lib/deck'

describe Deck do
  it 'deck setup' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
    expect(deck.cards).to eq(cards)
  end

  it 'rank of cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it 'high ranking cards setup' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expected = [card1, card3]

    expect(deck.high_ranking_cards).to eq(expected)
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'remove card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expected = [card2, card3]
    remaining_high_ranking_cards = [card3]

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq(expected)
    expect(deck.high_ranking_cards).to eq(remaining_high_ranking_cards)
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  it 'add card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])
    expected = [card3]
    expect(deck.high_ranking_cards).to eq(expected)
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
