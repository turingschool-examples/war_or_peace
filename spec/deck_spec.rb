require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new
    expect(deck).to be_an_instance_of(Deck)
  end
  
  it 'has an array of cards' do
    deck = Deck.new
    expect(deck.cards).to eq([])
  end
  
  it 'has a method to return the rank of a card
  at an index position passed as an argument' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(14)
    expect(deck.rank_of_card_at(2)).to eq(8)
  end
    
  it 'has a method to return face cards and aces' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, 'Queen', 12)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.high_ranking_cards).to be([card0, card2])
  end
  
  it 'has a method to return the percentage of high 
  ranking cards' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, 'Queen', 12)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.percent_high_ranking).to eq(2/3)
  end
  it 'has a method to remove one card from the top of the deck' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, 'Queen', 12)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq(cards.shift)
  end
  
  it 'has a method to add one card to the bottom of the deck' do
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:diamond, 'Queen', 12)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    card4 = Card.new(:club, '7', 7)
    deck.add_card(card4)
    
    expect(cards[3]).to eq(card4)
  end
end

































