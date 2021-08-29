require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'

describe Player do
  context 'iteration 2' do
    it 'has a name' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player1 = Player.new('Clarissa', deck)
      expect(player1).to be_a(Player)
    end
  end
end
