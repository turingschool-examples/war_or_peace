require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @card1 = Card.new(:spade, 'King', 13)
    @card2 = Card.new(:heart, 'Queen', 12)
    @card3 = Card.new(:diamond, '3', 3)
    @card4 = Card.new(:club, '3', 3)
    @card5 = Card.new(:heart, 'King', 13)
    @card6 = Card.new(:club, 'Jack', 11)
    @card7 = Card.new(:diamond, '5', 5)
    @card8 = Card.new(:heart, '8', 8)
    @cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8]
    @game = Game.new(@cards)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_cards
    assert_instance_of Array, @game.cards
    assert_equal 8, @game.cards.length
  end

  def test_it_has_a_player1
    assert_instance_of Player, @game.player1
  end

  def test_it_has_a_player2
    assert_instance_of Player, @game.player2
  end

  def test_each_player_gets_half_the_cards
    assert_equal 4, @game.player1.deck.cards.length
    assert_equal 4, @game.player2.deck.cards.length
  end
end
