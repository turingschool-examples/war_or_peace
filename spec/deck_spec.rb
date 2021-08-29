require 'rspec'
require './lib/card'
require './lib/deck'


RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new('Deck 1')

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'it has cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.cards).to be_an Array
    expect(deck.cards[0]).to eq card1
    expect(deck.cards[0]).to be_an_instance_of(Card)

  end

  it 'has a rank' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)

  end

  it 'has high ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq [card1, card3]
  end

  it 'has percent high ranking' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq 50.00
  end

  it 'it removes card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)

    deck.remove_card

    results = [card2, card3]
    expect(deck.cards).to eq(results)
  end

  it 'adds cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)

    cards = [card2, card3]

    deck = Deck.new(cards)

    deck.add_card(card4)

    results = [card2, card3, card4]
    expect(deck.cards).to eq(results)
  end
end
