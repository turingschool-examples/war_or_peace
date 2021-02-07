require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    game = Game.new('Morgan Freeman', 'Patrick Stewart')
    assert_instance_of Game, game
    assert_equal "Morgan Freeman", game.player1
    assert_equal "Patrick Stewart", game.player2
  end

  def test_it_starts


  end
end
