require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'


class WarOrPeaceRunnerTest < MiniTest::Test

  def test_start_game_method_starts_new_game
    game = Game.new

    assert_equal expected, game.run
  end



end
