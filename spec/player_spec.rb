require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "#initialize" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)
      expect(player).to be_a Player
    end

    it "#has_lost?" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to eq(false)
    end

    it "#remove_card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
      expect(player.deck).to be_a Deck
    end     
end