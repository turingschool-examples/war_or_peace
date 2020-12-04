require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_the_game_has_turns
    skip

  end

  def test_the_game_has_an_intro
    skip

  end

  def test_the_game_has_an_ending
    skip

  end

end
