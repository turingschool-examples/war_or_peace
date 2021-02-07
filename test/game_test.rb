require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


class GameTest < Minitest::Test
  def test_it_exists_and_has_readable_attributes
    game = Game.new("Elton John", "Freddy Mercury")
    assert_instance_of Game, game
    assert_equal "Elton John", game.player1
    assert_equal "Freddy Mercury", game.player2
  end
end
