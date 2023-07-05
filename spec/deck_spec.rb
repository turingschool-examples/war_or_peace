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

    expect(card1).to be_a(Card)
    expect(card2).to be_a(Card)
    expect(card3).to be_a(Card)
    expect(deck).to be_a(Deck)
  end

  it 'returns rank information of cards in deck' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3] 
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
    expect(deck.cards).to eq([card1, card2, card3])

    expect(deck.high_ranking_cards).to eq([card1, card3])
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'adds and removes cards from a deck' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3] 
    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
    deck.remove_card
    expect(deck.cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.0)
    deck.add_card(card4)
    expect(deck.cards).to eq([card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(33.33)
  end

end
