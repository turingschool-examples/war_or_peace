require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new(player1, player2)
    assert_instance_of Game, game
  end
end
