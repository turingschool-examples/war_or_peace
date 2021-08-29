require 'rspec'
require './lib/deck'
require './lib/card'

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
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
    expect(deck.rank_of_card_at(0)).to be_a(Integer)
    expect(deck.rank_of_card_at(0)).to be(12)
    expect(deck.rank_of_card_at(1)).to be(2)
  end

  it 'high ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it 'percent high ranking' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    expect(deck.high_ranking_cards.count).to be(2)
    expect(deck.cards.count).to be(4)
    expect(deck.percent_high_ranking).to be(50)
  end

  it 'remove_card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    expect(deck.remove_card).to be(card1)
  end

  it 'add card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    card5 = Card.new(:spade, 'Jack', 11)

    deck.add_card(card5)
    expect(deck).to eq([card1, card2, card3, card4, card5])
  end
end
