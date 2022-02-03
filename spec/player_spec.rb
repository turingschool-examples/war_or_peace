require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Deck do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player = Player.new('Jimbo', deck)
      expect(player).to be_an_instance_of(Player)
    end
  end

  describe '#initialize' do
    it 'has a name' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player = Player.new('Jimbo', deck)
      expect(player.name).to eq('Jimbo')
    end
  end

  describe '#initialize' do
    it 'has a deck that can be analyzed' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player = Player.new('Jimbo', deck)
      expect(player.deck).to eq(deck)
    end
  end

  describe '#has_lost?' do
    it 'can determine if a player has lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player = Player.new('Jimbo', deck)
      expect(deck.cards).to eq([card1, card2, card3])
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      player.deck.remove_card
      player.deck.remove_card
      expect(deck.cards).to eq([])
      expect(player.has_lost?).to eq(true)
    end
  end

end
