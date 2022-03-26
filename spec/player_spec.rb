require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "player initializes with a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.deck).to be_an_instance_of(Deck)
  end

  it "determine if player has not lost" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(false)
  end

  it "determine if player has lost" do
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to eq(true)
  end
end
