require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

describe Player do

  describe "#initialize" do
    it "is an instance of Player" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      cards = [card1, card2]
      deck1 = Deck.new(cards)
      player1 = Player.new("Jacob", deck1)

      expect(player1).to be_an_instance_of(Player)
    end
  end

  describe "attr_reader" do
    it "has readable attributes" do
      card1 = Card.new(:diamonds, 'ace', 14)
      cards = [card1]
      deck1 = Deck.new(cards)
      player1 = Player.new("Jacob", deck1)

      expect(player1.name).to eq("Jacob")
      expect(player1.deck).to eq(deck1)
    end
  end

end
