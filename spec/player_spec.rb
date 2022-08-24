require "rspec"
require "./lib/player"

RSpec.desribe Player do
  describe "#initialize" do
    it "exists" do 
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)
      expect(player).to be_a Player 
    end

    it "has readable attributes" do 
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)

      expect(player.name).to eq "Clarisa"
      expect(player.deck).to eq [card1, card2, card3]
    end
  end
end