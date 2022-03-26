require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  it "player exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    player = Player.new('Clarisa', deck)
    expect(player).to be_a(Player)
  end

  it "has a name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    player = Player.new('Clarisa', deck)
    expect(player.name).to eq("Clarisa")
  end

  it "has a deck" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  card4 = Card.new(:club, '5', 5)
  player = Player.new('Clarisa', deck)
  expect(player.deck).to eq(deck)
end

it "checks to see if player lost" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  card4 = Card.new(:club, '5', 5)
  player = Player.new('Clarisa', deck)
  expect(player.has_lost?).to eq(false)
end
end
