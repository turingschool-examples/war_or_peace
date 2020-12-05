require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
    def test_player_is_there
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player =Player.new('Clarissa', deck)

      assert_instance_of Player, player
    end
end
