require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    game = Game.new('Olivia', 'Jenny')
    assert_instance_of Game, game
    assert_equal "Olivia", game.player1
    assert_equal "Jenny", game.player2
  end

  def test_it_starts


  end
end
