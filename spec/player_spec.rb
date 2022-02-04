require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  it "exits" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Barack', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "exits" do
    card1 = Card.new(:diamond, 'Queen', 11)
    card2 = Card.new(:spade, '3', 2)
    card3 = Card.new(:heart, 'Ace', 13)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Barack', deck)

    expect(player.has_lost?).to eq(false)
  end
end
