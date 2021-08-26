require 'rspec'
require '../lib/deck'
require '../lib/card'

RSpec.describe Deck do

  it 'exists' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  it 'rank of cards' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
    expect(deck.rank_of_card_at(0)).to be_a(Integer)
    expect(deck.rank_of_card_at(0)).to be(12)
  end

  it 'high ranking cards' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck.high_ranking_cards).to eq([diamondQ, spadeA])
  end

  xit 'percent high ranking' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to be(50)
  end

  it 'remove_card' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck.remove_card).to be(diamondQ)
  end

  it 'add card' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    spadeA = Card.new(:spade, 'Jack', 11)
    expect(deck.add_card(spadeA)).to include(diamondQ, heart2, spadeA, club5, spadeA)
  end

end
