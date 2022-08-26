require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  describe "initialize game" do
    
    it "#start" do
      card1 = Card.new(:spade, 'Ace', 14)
      card2 = Card.new(:heart, 'Jack', 11)
      card3 = Card.new(:diamond, '8', 8)
      card4 = Card.new(:club, '10', 10)
      card5 = Card.new(:heart, '5', 5)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('John', deck1)
      player2 = Player.new('Paul', deck2)
      game = Game.new(player1, player2)
      
      game.start
      
      expect(player2.has_lost?).to eq(true)
    end
  end
end