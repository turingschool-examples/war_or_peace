require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe"player creation" do
    it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new([card1, card2, card3])
    player = Player.new("Clarissa", deck)
    expect(player1).to be_an_instance_of(Player)
    expect(deck.cards).to eq([card1, card2, card3])
    end

describe"player has lost" do
  it "expect it to be false by default"do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new([card1, card2, card3])
  player = Player.new("Clarissa", deck)
  expect(player).to be_an_instance_of(Player)
  expect(deck.cards).to eq([card1, card2, card3])
  require "pry";binding.pry
  expect(player.has_lost?).to eq false

end
end

   end
  end
