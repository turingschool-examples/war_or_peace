require 'rspec'
require '../lib/deck'
require '../lib/card'
require '../lib/player'

RSpec.describe Player do

  it 'exists' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new([diamondQ, heart2, spadeA, club5])
    player1 = Player.new('Clarisa', deck)
    expect(player1.name).to eq('Clarisa')
    expect(player1.deck).to eq(deck)
  end

  it 'has lost?' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new([diamondQ, heart2, spadeA, club5])
    player1 = Player.new('Clarisa', deck)
    expect(player1.has_lost?).to be(false)
  end

  xit 'remove_card' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)
    spadeA = Card.new(:spade, 'Ace', 14)
    club5 = Card.new(:club, '5', 5)
    cards = [diamondQ, heart2, spadeA, club5]
    deck = Deck.new(cards)
    expect(deck.remove_card).to be(diamondQ)
  end
end
