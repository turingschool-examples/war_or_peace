require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'


class PlayerTest < Minitest::Test

    def test_it_exists
      card1 = Card.new(:spade, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      card3 = Card.new(:heart, '2', 2)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player1 = Player.new("Jack", deck)


      assert_instance_of Player, player1
    end


    def test_it_has_lost

      card1 = Card.new(:spade, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      card3 = Card.new(:heart, '2', 2)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      player1 = Player.new("Jack", deck)


      assert_equal false, player1.has_lost?
    end

end
