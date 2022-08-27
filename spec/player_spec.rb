require "rspec"
require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/player.rb"

RSpec.describe Player do
  describe "#initialize" do
    it "exists, has name and has deck" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new("Clarisa", deck)

      expect(player).to be_an_instance_of(Player)
      expect(player.name).to eq("Clarisa")
      # require "pry";binding.pry
      expect(player.deck).to eq(deck)
    end
  end

  describe '#has_lost' do
    it "expect player to have lost the turn if out of cards" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new("Clarisa", deck)
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
    end
  end

end
