require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    game = Game.new
    assert_instance_of StandardDeck, game.standard_deck
    assert_equal [], game.turns
  end

  def test_take_turn
    game = Game.new
    game.create_two_players("Angel", "Chris")
    game.take_turn

    assert_equal 1, game.turns.length

    game.take_turn
    assert_equal 2, game.turns.length
  end
end
