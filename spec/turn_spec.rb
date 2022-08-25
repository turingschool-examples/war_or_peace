require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:diamond, 'Queen', 12)
      card5 = Card.new(:spade, '3', 3)
      card6 = Card.new(:heart, 'Ace', 14)
      card7 = Card.new(:spade, '3', 3)
      card8 = Card.new(:heart, 'Ace', 14)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Ryan', deck1)
      player2 = Player.new('Ash', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end
end
