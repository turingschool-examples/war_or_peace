require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end

  #it 'returns the deck of cards' do

  #end

  it 'returns rank of card at index locations' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.rank_of_card_at(0)).to eq 12
  end

  it 'lists cards with rank higher than 11' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    #deck.high_ranking_cards
    expect(deck.high_ranking_cards.count).to eq 2
    #expect(deck.high_ranking_cards).to include Queen
    #expect(deck.high_ranking_cards).to include card2
  end

  it 'calculates a percentage of high ranking cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to eq(66.66666666666666)
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to eq(100)
  end

  xit 'removes the first card from the deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    expect(deck.cards.first).to eq(card2)
  end

  xit 'adds a card to the bottom of the deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '2', 2)
    deck.add_card(:club, '2', 2)
    expect(deck.cards.last).to eq()
  end
end
