require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class  GameTest <  Minitest::Test
  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end
