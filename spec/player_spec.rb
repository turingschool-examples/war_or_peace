require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  describe '#initialize' do
    it 'exists with a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
  end

  describe '#has_lost?' do
    it 'tells if the player has lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)

      3.times do
        player.deck.remove_card
      end

      expect(player.has_lost?).to eq(true)
    end
  end
end
