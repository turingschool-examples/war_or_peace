require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  describe '#initialize' do
    it 'player name is Clarisa' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.name).to eq('Clarisa')
    end
    it 'player deck has card1, card2, and card3' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)
      expect(player.deck).to eq(deck)
    end
  end
end
