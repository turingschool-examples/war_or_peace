require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player).to be_an_instance_of(Player)
    end
    it "has readable attributes" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.name).to eq("Clarisa")
      expect(player.deck).to eq(deck)
    end
  end
  describe '#has_lost?' do
    it "can determine when player is out of cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card #2 cards remaining
      player.deck.remove_card #1 card remaining
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card #no cards remaining
      expect(player.has_lost?).to eq(true)
      expect(player.deck).to eq([])
    end
  end
end
