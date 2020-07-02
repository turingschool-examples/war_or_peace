require 'minitest/autorun'
require 'minitest/pride'
require "./lib/deck"
require "./lib/card"
require './lib/turn'
require './lib/player'
require './war_or_peace_runner.rb'


class DeckTest < Minitest::Test

    def test_it_exists
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spades, '3', 3)
      card3 = Card.new(:heart, 'Ace', 11)
      card4 = Card.new(:heart, '5', 5)

      cards = [card1, card2]
      cards1 = [card3, card4]
      deck1 = Deck.new(cards)
      deck2 = Deck.new(cards1)

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      game1 = Game.new
      assert_instance_of Game, game1
    end

    
  end
