require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
  end
  describe "#initialize" do
    it "has readable attributes" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
  end
  describe "#has_lost?" do
    it "has the player lost?" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(true)

      player.deck
      expect(player.deck).to be_an_instance_of(Deck)
      expect(player.deck.cards).to eq([])
      expect(player.deck.cards.length).to eq(0)
    end
  end
end
