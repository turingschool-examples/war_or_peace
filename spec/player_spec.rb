require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do

  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    expect(player1.name).to eq('Clarisa')
    expect(player1.deck).to eq(deck)
  end

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    expect(player1.has_lost?).to be(false)
  end

  it 'remove_card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    expect(deck.remove_card).to be(card1)
  end
end
